import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:shop_app/size_config.dart';


class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.orderItem,
  }) : super(key: key);
  final Order orderItem;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, OrderDetailScreen.routeName,
              arguments: {'order': orderItem});
        },
        child: Container(
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                    width: 88,
                    child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding: EdgeInsets.all(
                                getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(orderItem
                                .cart!.demoCarts[0].product.images[0]),
                          ),
                        ))),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order No.${orderItem.id}",
                      style: TextStyle(color: Colors.black, fontSize: 16,
                      fontFamily: "Muli-light"),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mã đơn hàng ",
                          style: TextStyle(fontSize: 12,
                          fontFamily: "Muli-light"),
                        ),
                        Text(
                          "VN${orderItem.trackingNumber}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Số lượng ',
                          style: TextStyle(fontSize: 12,
                          fontFamily: "Muli-light"),
                        ),
                        Text(
                          "${orderItem.cart?.totalQuantity}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tổng tiền',
                          style: TextStyle(fontSize: 13,
                          fontFamily: "Muli-Bold",
                          color: kPrimaryColor),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "\$${orderItem.cart?.totalValue.abs().toStringAsFixed(3)}",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],                     ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              Text(
              'Xem chi tiết',
                  style: TextStyle(color: kPrimaryMediumColor,
                  fontFamily: "Muli-light"),
            ),
            Text(
              "${DateFormat('HH:mm:ss  dd/MM/yyyy').format(orderItem.createdDay!)}",
              style: TextStyle(color: Colors.green,
              fontFamily: "Muli-light"),
            )
          ],
          ),
        )
        ]),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(17),
    topRight: Radius.circular(17),
    bottomLeft: Radius.circular(17),
    bottomRight: Radius.circular(17)),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 10,
    offset: Offset(0, 3), // changes position of shadow
    ),
    ],
    )));
  }
}

