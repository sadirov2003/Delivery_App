import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
  final int index;
  AppBarWidget({required this.index});
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return index == 0 ? 
    AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Лаваш',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list,
              color: Colors.black54,
            ),
          ),
          actions: [
            //SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black54,
              ),
            ),
          ],
        ) 
        : index == 1 ? AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ваш заказ',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                
                onPressed: (){},
                child: Text(
                  'очистить',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]
          ),
        )
        : index == 2 ? AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Избранное',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          centerTitle: true,
        )
        : AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          title: const Text(
            'Профиль',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        );
  }
}
