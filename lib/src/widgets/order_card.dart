import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/шаурма_классика.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      ),
                    ]),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Шаурма мини',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '220г',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Итого: 170 руб.',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                
              ),
              
              Expanded(
                flex: 0,
                child: Container(
                  
                  height: 85,
                  width: 40,
                  decoration: BoxDecoration(
                    //color: Colors.grey,
                    border: Border.all(
                      width: 2,
                      color: Color(0xFFD3D3D3),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 3,),
                      InkWell(
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.yellow,
                        ),
                        onTap: () {},
                      ),
                      const Text(
                        '0',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.yellow,
                        ),
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.remove_circle,
                          color: Colors.yellow,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
