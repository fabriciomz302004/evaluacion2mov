import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GuardarScreen'),),
      body: formulario(),
    );
  }
}

Widget formulario(){

TextEditingController _nombre= TextEditingController();
TextEditingController _cedula= TextEditingController();
TextEditingController _edad= TextEditingController();
TextEditingController _telefono= TextEditingController();

return Column(
  children: [
    TextField(controller: _cedula,),
    TextField(controller: _nombre,),  
    TextField(controller: _edad,),
    TextField(controller: _telefono,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text("Telefono")
    ),
    ),
    FilledButton.icon(onPressed: ()=>guardar(_cedula,_nombre,_edad,_telefono), label: Text("Guardar"), icon: Icon(Icons.save_as),)
  ],

);
}

Future<void> guardar(cedula, nombre, edad, telefono) async {

  DatabaseReference ref = FirebaseDatabase.instance.ref("estudiantes/${cedula.text}");
  await ref.set({
  "nombre": nombre.text,
  "edad": edad.text,
  "telefono": telefono.text,
  
  }
);
  
}
