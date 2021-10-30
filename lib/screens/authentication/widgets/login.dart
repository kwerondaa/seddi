import 'package:flutter/material.dart';
import 'package:seddi/controllers/appcontroller.dart';
import 'package:seddi/widgets/custom_button.dart';
import 'package:seddi/controllers/authcontroller.dart';
import 'package:get/get.dart';
import 'button_text.dart';

class LoginWidget extends StatelessWidget {
  final AppController _appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.white70),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: AuthController.instance.email,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.white70),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: AuthController.instance.password,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: CustomButton(
                bgColor: Colors.blue.shade700,
                text: "Login",
                onTap: () {
                  AuthController.instance.SignIn();
                }),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
              child: AuthBottomWidget(
                onTap: () {
                  _appController.changeDisplayAuthWidget();
                },
                text1: "Don\'t have an account?  ",
                text2: "Create account! ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
