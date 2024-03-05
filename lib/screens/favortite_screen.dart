import 'package:flutter/material.dart';
import 'package:food/components/food_item.dart';
import 'package:food/model/food.dart';

class FavortiteScreen extends StatelessWidget {
  const FavortiteScreen({super.key, required this.favorireFood});
  final List<Food> favorireFood;

  @override
  Widget build(BuildContext context) {
    if (favorireFood.isEmpty) {
      return const Center(
        child: Text('Nenhuma comida favoritada'),
      );
    } else {
      return ListView.builder(
        itemCount: favorireFood.length,
        itemBuilder: (context, index) {
          return FoodItem(food: favorireFood[index]);
        },
      );
    }
  }
}
