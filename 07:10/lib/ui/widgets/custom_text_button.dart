import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonAction;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonAction,
      child: Text(buttonText, style: TextStyle(color: Color(0xFF0F4888))),
    );
  }
}
