import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.blue,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w400),
          fillColor: bgColor,
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
