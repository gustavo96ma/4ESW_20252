import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String buttonText;
  final Function buttonAction;
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        onPressed: () => buttonAction(),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
