import 'package:flutter/material.dart';
import 'package:food/screens/Categories_screen.dart';
import 'package:food/screens/food_details_screen.dart';

import 'screens/categories_food_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        appBarTheme: const AppBarTheme(
          color: Colors.pink,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_FOOD: (_) => const CategoriesFoodScreen(),
        AppRoutes.FOOD_DETAIL: (_) => const FoodDetailsScreen(),
      },
    );
  }
}
