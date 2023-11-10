import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/password/info_card.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/slide_animation.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool canBeEdit = false;
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  String errorText = '';

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              errorText,
              style: TextStyle(fontSize: 15),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            DefaultButton(
              text: 'Hủy',
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

  void handleChangePassword() {
    if (currentPassword != currentUser.passwordHash) {
      setState(() {
        errorText = 'Mật khẩu không đúng';
      });
    }

    if (newPassword != confirmPassword) {
      setState(() {
        errorText = 'Mật khẩu không khớp';
      });
    }
    if (errorText != '') {
      _dialogBuilder(context);
      return;
    }

    Fluttertoast.showToast(
        msg: "Thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
        fontSize: 16.0);

    currentUser.changePassword(newPassword);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InfoCard(
                    title: 'Mật khẩu',
                    content: 'Nhập mật khẩu',
                    updateText: (String newText) {
                      setState(() {
                        currentPassword = newText;
                      });
                    }),
                InfoCard(
                    title: 'Mật khẩu mới',
                    content: 'Nhập mật khẩu mới',
                    updateText: (String newText) {
                      setState(() {
                        newPassword = newText;
                      });
                    }),
                InfoCard(
                    title: 'Nhập lại mật khẩu mới',
                    content: 'Nhập mật khẩu mới',
                    updateText: (String newText) {
                      setState(() {
                        confirmPassword = newText;
                      });
                    }),

                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: DefaultButton(
                      text: 'Đổi mật khẩu',
                      press: () {
                        handleChangePassword();
                      },
                      isDisabled: currentPassword == '' ||
                          newPassword == '' ||
                          confirmPassword == '',
                    ))
              ])),
    );
  }
}