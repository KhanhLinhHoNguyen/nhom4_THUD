import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Xác thực OTP",
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontFamily: "Muli-Bold",
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFAEC9),
                ),
              ),
              Text("Mã OTP được gửi qua  +0 898 860 ***"),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Gửi lại OTP",
                  style: TextStyle(decoration: TextDecoration.underline,
                  color: Color(0xffFFAEC9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Mã này sẽ hết hạn sau: "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Color(0xffFFAEC9)
            ),
          ),
        ),
      ],
    );
  }
}
