import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _username = '';
  String _email = ''; // Agregamos el campo de correo electrónico
  String _password = '';

  String get username => _username;
  String get email => _email; // Getter para el correo electrónico
  String get password => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    // Método para establecer el correo electrónico
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      // Autenticar al usuario con su correo electrónico y contraseña
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si la autenticación es exitosa, navegar a la página principal (/home)
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
        return true;
      } else {
        // Si la autenticación falla, retornar falso
        return false;
      }
    } catch (e) {
      // Si hay algún error durante la autenticación, imprimirlo y retornar falso
      print('Error al iniciar sesión: $e');
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    try {
      // Crear el usuario con correo electrónico y contraseña en Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Asignar el nombre de usuario (displayName) al usuario registrado
      User? user = userCredential.user;
      await user?.updateDisplayName(username);

      // Registro exitoso, retorna verdadero
      return true;
    } catch (e) {
      // Error durante el registro, retorna falso
      print('Error al registrar el usuario: $e');
      return false;
    }
  }
}
