import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/model/category.dart';

import '../components/food_item.dart';

class CategoriesFoodScreen extends StatelessWidget {
  const CategoriesFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryFood = dummyFoods.where(
      (food) {
        return food.categories.contains(category.id);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title)
      ),
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
