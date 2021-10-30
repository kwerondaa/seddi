import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<String> categories = [
    'Fish',
    'Meat',
    'Bacon',
    'Chicken',
    'Vegetables',
    'Drinks'
  ];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) => categoryBuilder(index)),
    );
  }

  categoryBuilder(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontSize: 18,
                  color:
                      index == selectedCategory ? Colors.black : Colors.grey),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 4,
              color: index == selectedCategory
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
