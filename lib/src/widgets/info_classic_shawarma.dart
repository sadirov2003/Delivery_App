import 'package:flutter/material.dart';

class InfoClassicShawarma extends StatelessWidget {
  final String nameView;
  final String weight;
  final String price;
  InfoClassicShawarma({
    required this.nameView,
    required this.weight,
    required this.price,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Text(
          '$nameView - ($weightгр)',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$price руб.',
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.yellow,
                size: 28,
              ),
            ),
            const SizedBox(width: 5),
            const Text('0',
                style: TextStyle(fontSize: 18, color: Colors.yellow)),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle,
                color: Colors.yellow,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
