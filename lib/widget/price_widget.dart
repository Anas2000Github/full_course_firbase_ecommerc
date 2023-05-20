import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:ceramic_shop/services/utils.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color =Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(text: '1.59\$', color: Colors.green, textSize: 22),
          5.width,
          Text(
            '2.59\$',
            style: TextStyle(
              color: color,
              fontSize: 16,
              decoration: TextDecoration.lineThrough
            ),
          ),
        ],
      ),
    );
  }
}
