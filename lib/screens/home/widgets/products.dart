import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seddi/constants/controllers.dart';
import 'package:seddi/models/product_model.dart';
import 'package:seddi/widgets/custom_text.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading....');
          return Container(
            height: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) =>
                    singleProductWidget(context, snapshot.data.docs[index])),
          );
        });
  }

  Widget singleProductWidget(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 2, bottom: 30, right: 20),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 10), blurRadius: 10)
            ]),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                document['image'],
                width: 280,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        document['name'],
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: Text(
                            document['description'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Ush.',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              document['price'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.timer),
                                Text(document['cooking_time'])
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.people_outline),
                                Text(' Serves ${document['serves']}')
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
