import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:ceramic_shop/widget/price_widget.dart';
import 'package:ceramic_shop/widget/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/utils.dart';
import 'heart_btn.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg',
                width: size.width * .21,
                height: size.width * .2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    HeartButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        isOnSale: true,
                        price: 5.9,
                        salePrice: 2.99,
                        textPrice: _quantityTextController.text,
                      ),
                    ),
                    5.width,
                    FittedBox(
                      child: TextWidget(
                        text: 'Kg',
                        color: color,
                        textSize: 14,
                        isTitle: true,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _quantityTextController,
                        key: const ValueKey('10 \$'),
                        style: TextStyle(color: color, fontSize: 18),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Quantity is missed';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.green,
                        enabled: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _quantityTextController.text = '1';
                            } else {
                              // total = usedPrice *
                              //     int.parse(_quantityTextController.text);
                            }
                          });
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0)))),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor)),
                  onPressed: () {},
                  child: TextWidget(
                    color: color,
                    text: 'Add to cart',
                    textSize: 20,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
