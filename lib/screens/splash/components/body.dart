import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Thế giới sách của riêng bạn",
      "image": "assets/images/gioithieu.png"
    },
    {
      "text": "Có mặt trên toàn quốc",
      "image": "assets/images/gioithieu3.png"
    },
    {
      "text": "Việc mua sắm thật dễ dàng",
      "image": "assets/images/gioithieu11.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(splashData.length,
                              (index) => AnimatedContainer(
                                  duration: kAnimationDuration,
                        margin: EdgeInsets.only(right: 5),
                        height: 6,
                        width: currentPage == index ? 20 : 6,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? Color(0xffFFAEC9) : Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
              ),
              Spacer(flex: 3),
              DefaultButton(
                text: "Tiếp tục",
                buttonColor: kPrimaryGradientColor5,
                press: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
              Spacer(),
              ],
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

