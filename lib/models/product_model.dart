import 'package:flutter/cupertino.dart';

class ProductModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';
  static const PRICE = 'prep_time';
  static const PREP_TIME = 'prep_time';
  static const COOKING_TIME = 'cooking_time';
  static const SERVES = 'serves';
  static const DESCRIPTION = 'description';
  static const INGREDIENTS = 'ingredients';
  static const METHOD = 'method';

  String id;
  String name;
  Image image;
  String price;
  String prep_time;
  String cooking_time;
  String serves;
  String description;
  List<String> ingredients;
  List<String> method;

  ProductModel(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.prep_time,
      this.cooking_time,
      this.serves,
      this.description,
      this.ingredients,
      this.method});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAME];
    image = data[IMAGE];
    price = data[PRICE];
    prep_time = data[PREP_TIME];
    cooking_time = data[COOKING_TIME];
    serves = data[SERVES];
    description = data[DESCRIPTION];
    ingredients = data[INGREDIENTS];
    method = data[METHOD];
  }
}
