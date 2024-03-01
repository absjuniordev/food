import 'package:flutter/material.dart';
import 'package:food/model/food.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;

    Widget _createSectionTitle(BuildContext contex, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    Widget _creatSectionContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 350,
        height: 190,
        padding: const EdgeInsets.all(10),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _creatSectionContainer(
              ListView.builder(
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
            _createSectionTitle(context, 'Passos'),
            _creatSectionContainer(
              ListView.builder(
                itemCount: food.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(food.steps[index]),
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(food.title);
        },
      ),
    );
  }
}
