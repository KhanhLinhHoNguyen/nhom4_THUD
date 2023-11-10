import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Order.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Order newOrder = arguments['order'];
    Future<void> _dialogBuilder(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Hủy đơn hàng?',
              style: TextStyle(fontSize: 15,
              fontFamily: "Muli-Bold"),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              DefaultButton(
                text: 'Có',
                width: 120,
                height: 50,
                press: () {
                  Navigator.of(context).pop();
                  orders.cancelOrder(newOrder);
                  Fluttertoast.showToast(
                      msg: "Hủy thành công!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: kPrimaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 10,
              ),
              DefaultButton(
                text: 'Không',
                width: 120,
                height: 50,
                press: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

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
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng tiền \n" ,
                    style: TextStyle(
                        fontFamily: "Muli-Bold",
                        color: kPrimaryMediumColor
                    ),
                    children: [
                      TextSpan(
                          text: "\$${newOrder.cart!.totalValue.toStringAsFixed(3)}",  // dang o day
                          style: TextStyle(fontSize: 14,color: Colors.black)
                      ),
                    ],
                  ),
                ),
                if (newOrder.status == 'Confirmed')
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Hủy đơn hàng", // dang o day
                      press: () {
                        _dialogBuilder(context);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
