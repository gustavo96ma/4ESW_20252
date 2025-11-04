import 'package:flutter/material.dart';

/// Campo de entrada customizado reutilizável
class CustomInput extends StatelessWidget {
  /// Construtor da classe [CustomInput]
  const CustomInput({
    required this.label,
    required this.hint,
    required this.controller,
    super.key,
    this.validator,
    this.obsecureText = false,
  });

  /// Construtor da classe [CustomInput]
  final String label;

  /// Texto de dica exibido no campo
  final String hint;

  /// Controlador do campo de entrada
  final TextEditingController controller;

  /// Função de validação do campo
  final String? Function(String?)? validator;

  /// Indica se o texto deve ser ocultado (para senhas)
  final bool obsecureText;

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
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: value.text.isEmpty ? Colors.grey : Colors.blue,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue, width: 2.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2.5),
              ),
              labelText: label,
              hint: Text(hint),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        );
      },
    );
  }
}
