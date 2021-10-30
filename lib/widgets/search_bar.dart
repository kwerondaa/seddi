import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  0,
                  2,
                ),
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Food Recipes',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.search),
                )),
          ),
        ),
      ),
    );
  }
}
