// main.dart
import 'package:app_nueva/NavegadorTabs.dart';
import 'package:app_nueva/firebase_options.dart';
import 'package:app_nueva/screens/LoginScreen.dart';
import 'package:app_nueva/screens/RegistroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
      // DEFINIR RUTAS AQUÍ PARA QUE FUNCIONE EL REDIRECCIONAMIENTO
      routes: {
        '/login': (context) => const Loginscreen(),
        '/registro': (context) => const Registroscreen(),
        '/menu': (context) => const NavegadorTabs(), // Ruta al BottomTab
      },
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("APP GASTRONOMICA")),
      body: botones(context),
    );
  }
}

Widget botones(context) {
  return Column(
    children: [
      FilledButton(onPressed: () => mostrarInfoModal(context), child: const Text("Desplegar Información")),
      ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/login'), 
          child: const Text("LOGIN")),
      ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/registro'), 
          child: const Text("REGÍSTRATE")),
    ],
  );
}

void mostrarInfoModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Información del Estudiante')),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: Leandro Moreira'), // Corregido según tu snippet
            Text('GitHub: fabriciomz302004'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cerrar')),
        ],
      );
    },
  );
}