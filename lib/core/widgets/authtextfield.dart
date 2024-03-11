import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextStyle? style; // Nuevo parámetro de estilo

  const AuthTextField({
    required this.prefixIcon,
    required this.hintText,
    this.onChanged,
    this.style, // Agregado el parámetro de estilo
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[200],
      ),
      child: TextField(
        onChanged: onChanged,
        style: style, // Aplicar el estilo proporcionado al texto del TextField
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
