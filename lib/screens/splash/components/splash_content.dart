import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Spacer(flex: 2),
        Text(
          "CélineBook",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(45),
              color:  Color(0xffFFAEC9),
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoSlab'),
        ),
        Text(
          text!,
          style: TextStyle(fontFamily: "Poppins-Light",),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: 400,
          width: 600,
        ),
      ],
    );
  }
}
