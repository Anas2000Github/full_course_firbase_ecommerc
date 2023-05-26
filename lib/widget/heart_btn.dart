import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = utils.color;
    return   GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        color: color,
        size: 22,
      ),
    );
  }
}
