import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeerScreens extends StatelessWidget {
  const LeerScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ciudades"), backgroundColor: Colors.blue),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/data/ciudades.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> data = json.decode(snapshot.data.toString());
            final List ciudades = data['ciudades'];

            return ListView.builder(
              itemCount: ciudades.length,
              itemBuilder: (context, index) {
                final item = ciudades[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(item['informacion']['imagen'], width: 50, errorBuilder: (c, e, s) => Icon(Icons.error)),
                    title: Text(item['nombre']),
                    subtitle: Text(item['provincia']),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(item['nombre']),
                          content: Text(item['descripcion']),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}