import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seddi/constants/controllers.dart';
import 'package:seddi/screens/home/widgets/products.dart';
import 'package:seddi/widgets/categories_widget.dart';
import 'package:seddi/widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seddi/widgets/popular_recipes.dart';
import 'package:seddi/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: _appBar_builder(),
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(() => UserAccountsDrawerHeader(
                accountName: Text(authController.userModel.value.name ?? ""),
                accountEmail:
                    Text(authController.userModel.value.email ?? ""))),
            ListTile(
              leading: Icon(Icons.book),
              title: CustomText(
                text: 'Payment History',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: CustomText(
                text: 'Log out',
              ),
              onTap: () {
                authController.signOut();
              },
            )
          ],
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 30.0,
          ),
          SearchBar(),
          SizedBox(
            height: 30.0,
          ),
          CategoriesWidget(),
          ProductsWidget(),
          PopularRecipes()
        ],
      )),
    );
  }

  Widget _appBar_builder() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: CustomText(
        text: 'Seddi',
        color: Colors.black,
        size: 24,
      ),
      actions: [
        SvgPicture.asset(
          'images/cartt.svg',
          width: 30,
        )
      ],
    );
  }
}
