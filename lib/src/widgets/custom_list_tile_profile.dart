import 'package:flutter/material.dart';

class CustomListTileProfile extends StatelessWidget {
  final IconData icon;
  final String text;
  
 CustomListTileProfile({
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(width: 15),
          Text(
            '$text',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
