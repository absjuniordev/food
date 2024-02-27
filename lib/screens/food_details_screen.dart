import 'package:flutter/material.dart';
import 'package:food/model/food.dart';

class FoodDetailsScreen extends StatelessWidget {

  const FoodDetailsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;


       return Scaffold(
           appBar: AppBar(
          title:  Text(food.title),
        ),
           body: Container(),
       );
  }
}