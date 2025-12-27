import 'package:app_nueva/screens/GuardarScreen.dart';
import 'package:app_nueva/screens/LeerScreens.dart';
import 'package:app_nueva/screens/LoginScreen.dart';
import 'package:app_nueva/screens/RegistroScreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => Loginscreen(),
        '/registro': (context) => Registroscreen(),
        '/guardar': (context) => Guardarscreen(),
        '/leer': (context) => LeerScreens(),
      },
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice= 0;
  List<Widget>paginas=[Loginscreen(),Registroscreen(),Guardarscreen(),LeerScreens()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PRINCIPAL")),
      body: paginas[indice],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
          BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: "Registro"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Guardar"),
          BottomNavigationBarItem(icon: Icon(Icons.line_style_sharp), label: "leer"),
        ]),
      /*
      drawer: Drawer(

        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text("Login"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Loginscreen()),
              ),
            ),
            ListTile(
              title: Text("Registro"),
              onTap: () => Navigator.pushNamed(context, '/registro'),
            ),
          ],
        ),
      ),
    */
    );
  }
}
