import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';

class CategoriesWidget extends StatelessWidget {
  final String catText, imgPath;
  final Color color;

  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: color.withOpacity(.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * .3,
              width: _screenWidth * .3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            TextWidget(
              text: catText,
              color: utils.color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
