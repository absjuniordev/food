import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favortite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          bottom: const TabBar(
            
            tabs: [
              Tab(
                text: "Categoria",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Favorito",
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavortiteScreen(),
          ],
        ),
      ),
    );
  }
}
