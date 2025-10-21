import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonAction;
  final IconData? icon;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: buttonAction,
      icon: Icon(icon, color: Color(0xFF0F4888)),
      label: Text(buttonText, style: TextStyle(color: Color(0xFF0F4888))),
    );
  }
}
