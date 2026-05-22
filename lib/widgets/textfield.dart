import 'package:flutter/material.dart';

Widget textfield(TextEditingController controller ,String label) {
  return SizedBox(
    width: 400,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 243, 216, 199),
        filled: true,
        label: Text('$label : ',style: TextStyle(color: Colors.blue[800]),),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
        ),
      ),
    ),
  );
}
