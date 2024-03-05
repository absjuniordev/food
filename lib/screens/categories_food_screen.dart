import 'package:flutter/material.dart';
import 'package:food/model/category.dart';
import 'package:food/model/food.dart';
import '../components/food_item.dart';

class CategoriesFoodScreen extends StatelessWidget {
  const CategoriesFoodScreen({super.key, required this.food});
  final List<Food> food;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryFood = food.where((food) {
      return food.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: categoryFood.length,
        itemBuilder: (ctx, index) {
          return FoodItem(
            food: categoryFood[index],
          );
        },
      ),
    );
  }
}
