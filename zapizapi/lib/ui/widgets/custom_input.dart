import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  const CustomInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        // debug: print controller empty state
        // print('[DEBUG] controller: ${value.text.isEmpty}');
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.0),
            //   borderSide: BorderSide(color: Colors.red, width: 2.0),
            // ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: value.text.isEmpty ? Colors.grey : Colors.blue,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.blue, width: 2.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red, width: 2.5),
            ),
            labelText: label,
            hint: Text(hint),
            fillColor: Colors.red,
          ),
        );
      },
    );
  }
}
