import 'package:flutter/material.dart';

Widget elevbutton(String title, void Function() callback) {
  return ElevatedButton(
    onPressed: callback,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple, // Button background color
      foregroundColor: Colors.white, // Text and icon color
      shadowColor: Colors.black, // Shadow color
      elevation: 8, // Shadow depth
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ), // Internal spacing
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    child: Text(title),
  );
}
