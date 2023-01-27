import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/data/food_data.dart';
import 'package:flutter_lavash/src/widgets/foods.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        final _foods = foods[index];
        return Foods(foods: _foods);
      },
    );
  }
}
