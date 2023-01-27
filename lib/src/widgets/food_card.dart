import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/data/category_data.dart';

class FoodCard extends StatefulWidget {
  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white12),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () {
                if (color == Colors.white) {
                  color = Colors.white60;
                } else {
                  color = Colors.white;
                }

                setState(() {});
              },
              child: Card(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image:
                              AssetImage('${categories[index].imagePath}'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(width: 0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${categories[index].categoryName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                              '${categories[index].numberOfItems} видов'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
