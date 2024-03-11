import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false; // Estado del modo oscuro

  // Getter para obtener el estado actual del modo oscuro
  bool get isDarkMode => _isDarkMode;

  // Método para cambiar el estado del modo oscuro
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notificar a los oyentes que el estado ha cambiado
  }
}
