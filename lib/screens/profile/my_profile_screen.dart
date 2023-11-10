import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';

import 'personal_info/body.dart';

class MyProfileScreen extends StatelessWidget {
  static String routeName = "/profile/info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân"),
        titleTextStyle: TextStyle(fontFamily: "Muli-Bold",
        color: kPrimaryColor),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
