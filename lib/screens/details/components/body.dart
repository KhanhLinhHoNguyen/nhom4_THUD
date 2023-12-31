import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/size_dots.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedSize = -1;
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color:  Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color:  Color(0xffffffff),
                child: Column(
                  children: [
                    SizeDots(
                      product: widget.product,
                      selectSize: (index) => {
                        setState(() {
                          selectedSize = index;
                        })
                      },
                      selectAmount: (index) => {
                        setState(() {
                          amount = index;
                        })
                      },
                    ),
                    TopRoundedContainer(
                      color: Color(0xFFFfffff),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Thêm vào giỏ hàng",
                          buttonColor: kPrimaryGradientColor5,
                          press: () {
                            CartItem currentCart = new CartItem(
                                product: widget.product,
                                numOfItem: amount, //thêm vào giỏ hàng thành công thì hiện thông báo trang chủ
                                size: selectedSize == -1
                                    ? widget.product.sizes[0]
                                    : selectedSize); // Check size 0
                            cart.addToCart(currentCart);
                            Fluttertoast.showToast(
                                msg: "Sách đã được thêm vào giỏ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xffFFAEC9),

                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
