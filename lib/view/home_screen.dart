import 'package:card_swiper/card_swiper.dart';
import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:ceramic_shop/inner_screens/on_sale_screen.dart';
import 'package:ceramic_shop/provider/dark_theme_provider.dart';
import 'package:ceramic_shop/services/global_method.dart';
import 'package:ceramic_shop/services/utils.dart';
import 'package:ceramic_shop/widget/feed_items.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = utils.color;
    final List<String> _offersImages = [
      'assets/images/offres/Offer1.jpg',
      'assets/images/offres/Offer2.jpg',
      'assets/images/offres/Offer3.jpg',
      'assets/images/offres/Offer4.jpg'
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offersImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offersImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white70, activeColor: Colors.red)),
                autoplay: true,
                // control: SwiperControl(color: Colors.black),
              ),
            ),
            6.height,
            TextButton(
                onPressed: () {
                  GlobalMethod.navigateTo(ctx: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: 'View all',
                  color: Colors.blue,
                  maxLines: 1,
                  textSize: 20,
                )),
            6.height,
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      5.width,
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                8.width,
                Flexible(
                  child: SizedBox(
                    height: size.height * .24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 21,
                    isTitle: true,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        text: 'Browse all',
                        color: Colors.blue,
                        maxLines: 1,
                        textSize: 18,
                      )),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing:10,
              // mainAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * .59),
              children: List.generate(4, (index) {
                return FeedWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
