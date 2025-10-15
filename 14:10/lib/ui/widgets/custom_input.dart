import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obsecureText;
  const CustomInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        // debug: print controller empty state
        // print('[DEBUG] controller: ${value.text.isEmpty}');
        return SizedBox(
          height: 68,
          child: TextFormField(
            obscureText: obsecureText,
            validator: validator,
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
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.red, width: 2.5),
              ),
              labelText: label,
              hint: Text(hint),
              fillColor: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
