// LoginScreen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  TextEditingController _correo = TextEditingController();
  TextEditingController _contrasenia = TextEditingController();

  return Column(
    children: [
      TextField(controller: _correo, decoration: const InputDecoration(label: Text("Correo"))),
      TextField(controller: _contrasenia, obscureText: true, decoration: const InputDecoration(label: Text("Contraseña"))),
      FilledButton(onPressed: () => login(_correo, _contrasenia, context), child: const Text("Login"))
    ],
  );
}

Future<void> login(correo, contrasenia, context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo.text, password: contrasenia.text);
    // REDIRIGIR AL NAVEGADOR DE TABS
    Navigator.pushNamed(context, '/menu');
  } on FirebaseAuthException catch (e) {
    // REQUISITO: Manejar errores con Alerts
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error de Acceso"),
        content: Text(e.code),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
      ),
    );
  }
}