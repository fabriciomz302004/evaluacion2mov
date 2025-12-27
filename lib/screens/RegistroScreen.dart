import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),

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
      FilledButton(onPressed: ()=>registro(_correo,_contrasenia, context), child: Text("Registro"))
    ],)
  );
}
Future<void> registro(correo, contrasenia, context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: correo.text,
    password: contrasenia.text,
  );
  Navigator.pushNamed(context, '/login');
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

}