import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seddi/screens/details_screen/details_screen.dart';
import 'package:seddi/widgets/custom_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PopularRecipes extends StatefulWidget {
  const PopularRecipes({Key key}) : super(key: key);

  @override
  _PopularRecipesState createState() => _PopularRecipesState();
}

class _PopularRecipesState extends State<PopularRecipes> {
  final Stream _productStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: CustomText(
            text: 'Popular Recipes',
            size: 20,
          ),
        ),
        Container(
          height: 500,
          child: StreamBuilder(
              stream: _productStream,
              builder: (context, snapshot) {
                if (snapshot.data == null)
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.teal,
                    ),
                  );
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) =>
                        _popularWidget(context, snapshot.data.docs[index]));
              }),
        ),
      ],
    );
  }

  Widget _popularWidget(BuildContext context, DocumentSnapshot document) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 20, 10, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                    product: document,
                                  ))),
                      child: Container(
                        width: 160,
                        child: Text(
                          document['name'],
                          style: TextStyle(
                              fontSize: 19.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: 'Ush.',
                          size: 14,
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: document['price'],
                        ),
                      ],
                    )
                  ],
                ),
                RatingBarIndicator(
                  rating: document['rating'].toDouble(),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber.shade200,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  unratedColor: Colors.grey.shade300,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          for (var tag in document['tags'])
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey.shade200,
                              ),
                              margin: EdgeInsets.only(right: 4),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 20,
          bottom: 10,
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsScreen(
                          product: document,
                        ))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                document['image'],
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
