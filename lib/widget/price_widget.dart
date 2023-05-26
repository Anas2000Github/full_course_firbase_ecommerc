import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:ceramic_shop/services/utils.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
              text:
                  '${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}\$',
              color: Colors.green,
              textSize: 18),
          5.width,
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '${(price * int.parse(textPrice)).toStringAsFixed(2)}\$',
              style: TextStyle(
                  color: color,
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
