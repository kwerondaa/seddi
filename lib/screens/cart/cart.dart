import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seddi/widgets/custom_text.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFF7F7F7),
          title: CustomText(
            text: 'Your Order',
            color: Colors.black,
            size: 24,
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Row(
                children: [Image.asset('images/')],
              ),
            )
          ],
        ));
  }
}
