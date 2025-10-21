import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String errorText;
  final Color backgroundColor;
  final IconData icon;
  const CustomToast({
    super.key,
    required this.errorText,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 12.0),
          Text(errorText, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
