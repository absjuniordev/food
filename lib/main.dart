import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/model/food.dart';
import 'package:food/screens/food_details_screen.dart';
import 'package:food/screens/settings_screen.dart';
import 'package:food/screens/tabs_screen.dart';
import 'screens/categories_food_screen.dart';

import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Food> _availabFoods = dummyFoods;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
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
        scaffoldBackgroundColor: const Color.fromARGB(255, 252, 249, 249),
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
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_FOOD: (ctx) =>
            CategoriesFoodScreen(food: _availabFoods),
        AppRoutes.FOOD_DETAIL: (ctx) => const FoodDetailsScreen(),
        AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),
      },
    );
  }
}
