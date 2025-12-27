import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gastronomía Ecuador')),
      body: formulario(),
    );
  }
}

Widget formulario() {
  TextEditingController _id = TextEditingController();
  TextEditingController _plato = TextEditingController();
  TextEditingController _ciudad = TextEditingController();

  return Column(
    children: [
      TextField(controller: _id, decoration: const InputDecoration(label: Text("ID del Platillo"))),
      TextField(controller: _plato, decoration: const InputDecoration(label: Text("Plato Típico"))),  
      TextField(controller: _ciudad, decoration: const InputDecoration(label: Text("Ciudad"))),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => guardar(_id, _plato, _ciudad), 
        label: const Text("Guardar Platillo"), 
        icon: const Icon(Icons.save),
      )
    ],
  );
}

Future<void> guardar(id, plato, ciudad) async {
  // Guarda en el nodo 'gastronomia' según el ID (Requisito 2.0 pts)
  DatabaseReference ref = FirebaseDatabase.instance.ref("gastronomia/${id.text}");
  await ref.set({
    "plato": plato.text,
    "ciudad": ciudad.text,
  });
}