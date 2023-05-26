import 'package:ceramic_shop/widget/on_sale_widget.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import '../widget/feed_items.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';

  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = true;
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(IconlyLight.arrowLeft2, color: color),
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Products on sale',
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/box.png'),
                    ),
                    Text(
                      'No products on sale yet!\n Stay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30, color: color, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing:10,
              // mainAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * .45),
              children: List.generate(18, (index) {
                return OnSaleWidget();
              }),
            ),
    );
  }
}
