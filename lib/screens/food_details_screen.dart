import 'package:flutter/material.dart';
import 'package:food/model/food.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              food.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            width: 350,
            height: MediaQuery.of(context).size.height / 2.1,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: food.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      food.ingredients[index],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
