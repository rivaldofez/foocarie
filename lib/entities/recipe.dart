import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  String id;
  String name;
  double price;
  double calories;
  double time;
  int serving;
  bool isFavorite;
  String image;
  String description;

  Recipe(
      {required this.id,
      required this.calories,
      required this.description,
      required this.image,
      required this.isFavorite,
      required this.name,
      required this.price,
      required this.serving,
      required this.time});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
