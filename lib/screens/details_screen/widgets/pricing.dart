import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seddi/widgets/custom_text.dart';

class Pricing extends StatefulWidget {
  final DocumentSnapshot product;

  const Pricing({Key key, this.product}) : super(key: key);

  @override
  _PricingState createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  @override
  Widget build(BuildContext context) {
    var prod_qnty = 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 30,
                )),
            CustomText(
              text: prod_qnty.toString(),
              size: 28,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    prod_qnty = prod_qnty + 1;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                )),
          ],
        ),
        CustomText(
          text: 'Ush.${widget.product['price']}',
          size: 24.0,
        )
      ],
    );
  }
}
