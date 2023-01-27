import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/models/food_model.dart';
import 'package:flutter_lavash/src/widgets/foods.dart';
import 'package:flutter_lavash/src/widgets/info_classic_shawarma.dart';

class ViewClassicShawarma extends StatelessWidget {
  final food = Food(
    id: '1',
    imagePath: 'assets/images/шаурма_классика.jpg',
    name: 'Классическая',
    description:
        'Состав: Курица, огурцы соленые, помидоры, лук, сыр, сырный соус, фирменные соусы',
    weight: '380г',
    price: '210 руб.',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black54),
          title: const Text(
            'Классическая шаурма',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.black87,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('${food.imagePath}', fit: BoxFit.cover),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 15, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${food.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${food.description}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'На выбор:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey, thickness: 1),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 5),
                            InfoClassicShawarma(nameView: 'Мини', weight: '220', price: '170'),
                            VerticalDivider(thickness: 1.9,color:Colors.white),
                            InfoClassicShawarma(nameView: 'Стандарт', weight: '320', price: '200'),
                          ],
                        ),
                        const Divider(color: Colors.grey, thickness: 1),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InfoClassicShawarma(nameView: 'Макси', weight: '420', price: '240'),
                            const SizedBox(width: 30),
                            InfoClassicShawarma(nameView: 'Мега', weight: '520', price: '290'),
                          ],
                        ),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

