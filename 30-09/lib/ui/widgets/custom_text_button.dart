import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  const CustomTextButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(buttonText, style: TextStyle(color: Color(0xFF0F4888))),
    );
  }
}
