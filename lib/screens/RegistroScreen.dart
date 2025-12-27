import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  TextEditingController _correo = TextEditingController();
  TextEditingController _contrasenia = TextEditingController();

  return Column(
    children: [
      TextField(
          controller: _correo,
          decoration: const InputDecoration(label: Text("Correo Electrónico"))),
      TextField(
          controller: _contrasenia,
          obscureText: true,
          decoration: const InputDecoration(label: Text("Contraseña"))),
      const SizedBox(height: 20),
      FilledButton(
          onPressed: () => registro(_correo, _contrasenia, context),
          child: const Text("Registrarse"))
    ],
  );
}

Future<void> registro(correo, contrasenia, context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo.text,
      password: contrasenia.text,
    );
    
    // Redirección al Login si el registro es exitoso
    Navigator.pushNamed(context, '/login');

  } on FirebaseAuthException catch (e) {
    // Manejo de errores mediante Alerts (3.5 pts de seguridad)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error de Registro"),
        content: Text(e.code), // Muestra el código de error de Firebase
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"))
        ],
      ),
    );
  }
}