import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;

  const CustomTextField({
    required this.text,
    required this.isObscure,
    this.suffixIcon,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: Colors.grey[500]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: Colors.grey[500]!),
        ),
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: MediaQuery.of(context).size.width * 0.035,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.03,
      ),
    );
  }
}
