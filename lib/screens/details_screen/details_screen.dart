import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seddi/screens/cart/cart.dart';
import 'package:seddi/widgets/custom_text.dart';
import 'package:tabbed_view/tabbed_view.dart';

class DetailsScreen extends StatefulWidget {
  final DocumentSnapshot product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(itemBuilder: (context, index) {
                return Image.network(
                  widget.product['image'],
                  fit: BoxFit.cover,
                );
              }),
            ),
            Positioned(
                top: 30,
                left: 30,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.5),
                            border: Border.all(
                                style: BorderStyle.solid, color: Colors.white)),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              size: 28,
                            )),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white.withOpacity(0.8),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'images/cartt.svg',
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: 'Prep time',
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: widget.product['prep_time'],
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: 'Cook time',
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: widget.product['cooking_time'],
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: 'Servings',
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: '${widget.product['serves']} People',
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            DraggableScrollableSheet(
                initialChildSize: .5,
                minChildSize: .5,
                builder: (context, controller) {
                  var prod_qnty = 1;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: ListView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Icon(
                              Icons.drag_handle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CustomText2(
                            text: widget.product['name'],
                            color: Theme.of(context).primaryColor,
                            size: 28,
                            weight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              for (var tag in widget.product['tags'])
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200,
                                  ),
                                  margin: EdgeInsets.only(right: 4),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4),
                                    child: Text(
                                      tag.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //========================== REVIEWS =======================================================================================================
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: widget.product['rating'].toDouble(),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              unratedColor: Colors.grey.shade300,
                              direction: Axis.horizontal,
                            ),
                            CustomText2(
                              text: '(2383 Reviews)',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

//=================== PRICING ========================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                            width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                    text: prod_qnty.toString(),
                                    size: 28,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ],
                            ),
                            CustomText(
                              text: 'Ush.${widget.product['price']}',
                              size: 24.0,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),

                        // =============================  SERVINGS & PREP TIME ======================================================================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Servings',
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  text: '${widget.product['serves']} pp',
                                  weight: FontWeight.w500,
                                  size: 20,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Prep Time',
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  text: widget.product['prep_time'],
                                  weight: FontWeight.w500,
                                  size: 20,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Cook Time',
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  text: widget.product['cooking_time'],
                                  weight: FontWeight.w500,
                                  size: 20,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //=============== DESCRIPTION ========================================
                        CustomText(
                          text: 'Description',
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.product['description'],
                          style: TextStyle(height: 1.4),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // ============ ADD TO CART SECTION ==============================================
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Theme.of(context).primaryColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Cart())),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'images/cartt.svg',
                                          width: 30,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          text: 'Add to Cart',
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TabBar(
                          tabs: [
                            Tab(
                              child: CustomText(
                                text: 'Ingredients',
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: 'Directions',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 800,
                          child: TabBarView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var ingredient
                                      in widget.product['ingredients'])
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        ingredient,
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var method in widget.product['method'])
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(method),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
