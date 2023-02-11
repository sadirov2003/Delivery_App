

import 'package:flutter/material.dart';

class SnackBarService {
  static const errorColor = Colors.red;
  static const okColor = Colors.green;

  static Future<void> showSnackBar(
      BuildContext context, String message, bool error) async {

    SnackBar snackBar = SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              content: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}