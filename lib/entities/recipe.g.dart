// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String,
      calories: (json['calories'] as num).toDouble(),
      description: json['description'] as String,
      image: json['image'] as String,
      isFavorite: json['isFavorite'] as bool,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      serving: json['serving'] as int,
      time: (json['time'] as num).toDouble(),
      categories: json['categories'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories,
      'price': instance.price,
      'calories': instance.calories,
      'time': instance.time,
      'serving': instance.serving,
      'isFavorite': instance.isFavorite,
      'image': instance.image,
      'description': instance.description,
    };
