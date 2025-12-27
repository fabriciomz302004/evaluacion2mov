import 'dart:convert';
import 'package:flutter/material.dart';

class LeerScreens extends StatelessWidget {
  const LeerScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ciudades del Ecuador"), backgroundColor: Colors.blue),
      body: lista(),
    );
  }
}

Future<List> leerJson(BuildContext context) async {
  final String respuesta = await DefaultAssetBundle.of(context).loadString('assets/data/ciudades.json');
  final data = await json.decode(respuesta);
  return data['ciudades'];
}

Widget lista() {
  return FutureBuilder(
    future: null, // Solo para estructura, el Builder interno maneja la carga
    builder: (context, snapshot) {
      return FutureBuilder(
        future: leerJson(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  leading: Image.network(item['informacion']['imagen'], width: 50),
                  title: Text(item['nombre']),
                  subtitle: Text(item['provincia']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(item['nombre']),
                        content: Text(item['descripcion']),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
                      ),
                    );
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    },
  );
}