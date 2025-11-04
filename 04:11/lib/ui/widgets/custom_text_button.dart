import 'package:flutter/material.dart';

/// Botão de texto customizado reutilizável
class CustomTextButton extends StatelessWidget {
  /// Construtor da classe [CustomTextButton]
  const CustomTextButton({
    required this.buttonText,
    required this.buttonAction,
    super.key,
    this.icon,
  });

  /// Construtor da classe [CustomTextButton]
  final String buttonText;

  /// Ação executada ao pressionar o botão
  final VoidCallback? buttonAction;

  /// Ícone exibido no botão
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: buttonAction,
      icon: Icon(icon, color: const Color(0xFF0F4888)),
      label: Text(buttonText, style: const TextStyle(color: Color(0xFF0F4888))),
    );
  }
}
