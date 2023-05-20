import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:ceramic_shop/widget/price_widget.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = utils.color;

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor.withOpacity(.9),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg',
                    width: size.width * .22,
                    height: size.width * .22,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: '1KG',
                        color: color,
                        textSize: 22,
                        isTitle: true,
                      ),
                      6.height,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              color: color,
                              size: 22,
                            ),

                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              color: color,
                              size: 22,
                            ),

                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              PriceWidget(),
              5.height,
              TextWidget(text: 'Product title', color: color, textSize: 16,isTitle: true,),
              5.height,

            ],
          ),
        ),
      ),
    );
  }
}
