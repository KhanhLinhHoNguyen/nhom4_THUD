import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';
import 'package:shop_app/utils/create_id.dart';


import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';


class CheckoutCard extends StatefulWidget {
  static String routeName = "/cart";


  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}


class _CheckoutCardState extends State<CheckoutCard> {
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: kPrimaryMediumColor,
            size: 100,
          ),
        );
      },
    );


    // Simulate a delay (e.g., network request)
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xffFFAEC9).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng tiền:\n",
                    style: TextStyle(
                      fontFamily: "Muli-Bold",
                      color: kPrimaryColor
                    ),
                    children: [
                      TextSpan(
                        text: "${cart.totalValue.abs().toStringAsFixed(3)}\đ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text:  "Đặt hàng",
                    buttonColor: kPrimaryGradientColor5 ,
                    isDisabled: cart.demoCarts.length <= 0,
                    press: () {
                      currentOrder.updateOrder(Order(
                        cart: cart,
                        id: generateRandomNumberString(5),
                        createdDay: DateTime.now(),
                      ));
                      _showLoadingDialog(context);
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushNamed(context, PaymentScreen.routeName);
                      });
                    },
                  ),
                ),
              ], //chirlden
            ),
          ],
        ),
      ),
    );
  }
}
