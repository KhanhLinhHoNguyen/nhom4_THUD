import 'package:flutter/material.dart';
import 'package:shop_app/screens/payment/components/payment_option_card.dart';


import '../../../size_config.dart';
import 'section_title.dart';


class PaymentOption extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
            title: "Thanh toán",
            press: () {},
          ),


          SizedBox(height: getProportionateScreenWidth(10)), // height of lctt and option tt


          PaymentOptionCard()
        ],
      ),
    );
  }
}
