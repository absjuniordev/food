import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/model/food.dart';
import 'package:food/model/settings.dart';
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
  Settings settings = Settings();
  List<Food> _availableMeals = dummyFoods;
  List<Food> _favorireFood = [];

  void _fliterFoods(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyFoods.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Food food) {
    setState(() {
      _favorireFood.contains(food)
          ? _favorireFood.remove(food)
          : _favorireFood.add(food);
    });
  }

  bool _isFavorite(Food food) {
    return _favorireFood.contains(food);
  }

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
        AppRoutes.HOME: (ctx) => TabsScreen(favorireFood: _favorireFood),
        AppRoutes.CATEGORIES_FOOD: (ctx) =>
            CategoriesFoodScreen(food: _availableMeals),
        AppRoutes.FOOD_DETAIL: (ctx) => FoodDetailsScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (ctx) =>
            SettingsScreen(settings: settings, onSettingsChanged: _fliterFoods),
      },
    );
  }
}
