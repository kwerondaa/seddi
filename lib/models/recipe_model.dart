class RecipeModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const PRICE = 'price';
  static const INGREDIENTS = 'ingredients';
  static const TIME = 'time';
  static const DESCRIPTION = 'description';

  final String name, description;
  final String id, price, time;
  final List<String> ingredients;

  RecipeModel(
      {this.name,
      this.description,
      this.id,
      this.price,
      this.time,
      this.ingredients});
}
