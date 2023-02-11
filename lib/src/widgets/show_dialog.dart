import 'package:flutter/material.dart';

Future<void> showLoadingIndicator(BuildContext context, String message) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Text('$message'),
            ],
          ),
        );
      });
}
