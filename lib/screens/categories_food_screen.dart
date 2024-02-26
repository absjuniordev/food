import 'package:flutter/material.dart';
import 'package:food/model/category.dart';

class CategoriesFoodScreen extends StatelessWidget {

  const CategoriesFoodScreen({super.key, 
    required this.category,
  });


  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(category.title),
      ),
      body:  Center(
        child: Text('Receitas por Categorias ${category.id}'),
      ),
    );
  }
}
