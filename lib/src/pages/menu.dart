

import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/data/food_data.dart';
import 'package:flutter_lavash/src/widgets/food_card.dart';
import 'package:flutter_lavash/src/widgets/foods.dart';
import 'package:flutter_lavash/src/widgets/search_field.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Column(
                  children: [
                    FoodCard(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: SearchField(),
                    ),
                  ],
                ),
              ),
              pinned: true,
              expandedHeight: 312,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/шаурмашашлык.png',
                        width: double.maxFinite,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                final _foods = foods[index];
                return Foods(foods: _foods);
              },
              childCount: foods.length,
            ),),
          ],
        );
  }
}