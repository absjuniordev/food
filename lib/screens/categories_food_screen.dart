import 'package:flutter/material.dart';
import 'package:food/model/category.dart';

class CategoriesFoodScreen extends StatelessWidget {
  const CategoriesFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por Categorias ${category.id}'),
      ),
    );
  }
}
