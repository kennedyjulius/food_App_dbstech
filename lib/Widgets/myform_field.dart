import 'package:flutter/material.dart';

class MyformField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String? Function(String?)? validator;

  const MyformField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.suffixIcon,
    required this.prefixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
