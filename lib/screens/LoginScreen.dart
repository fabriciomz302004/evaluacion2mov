import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Login"),
      ),
      body:formulario(context),
    );
  }
}
Widget formulario(context){
  TextEditingController _correo = TextEditingController();
  TextEditingController _contrasenia = TextEditingController();

  return (
    Column(children: [
      TextField(controller: _correo),
      TextField(controller: _contrasenia),
      FilledButton(onPressed: ()=>login(_correo,_contrasenia, context), child: Text("Login"))
    ],)
  );
}

Future<void> login(correo, contrasenia, context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: correo.text,
    password: contrasenia.text
  );
  Navigator.pushNamed(context, '/guardar');
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  
}