import 'package:card_swiper/card_swiper.dart';
import 'package:ceramic_shop/provider/dark_theme_provider.dart';
import 'package:ceramic_shop/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils=Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;

    final List<String> _offersImages=[
      'assets/images/offres/Offer1.jpg',
      'assets/images/offres/Offer2.jpg',
      'assets/images/offres/Offer3.jpg',
      'assets/images/offres/Offer4.jpg'

    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.33,
            child: Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.asset(_offersImages[index],fit: BoxFit.fill,);
                },
                itemCount: _offersImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(color: Colors.white70,activeColor: Colors.red)
                ),
                autoplay: true,
                // control: SwiperControl(color: Colors.black),
              ),
          ),
          OnSaleWidget(),

        ],
      ),
    );
  }
}
