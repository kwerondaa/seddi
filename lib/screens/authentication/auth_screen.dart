import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seddi/controllers/appcontroller.dart';
import 'package:seddi/screens/authentication/widgets/login.dart';
import 'package:seddi/screens/authentication/widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'images/fdbg6.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fitHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 1.3),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 70,
                    ),
                    Visibility(
                        visible: _appController.isLoginWidgetDisplayed.value,
                        child: LoginWidget()),
                    Visibility(
                        visible: !_appController.isLoginWidgetDisplayed.value,
                        child: RegistrationWidget()),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 6,
                  left: 20,
                  child: Image.asset(
                    'images/logo.png',
                    width: 140,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
