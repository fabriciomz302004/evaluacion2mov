

import 'package:app_nueva/firebase_options.dart';
import 'package:app_nueva/screens/LoginScreen.dart';
import 'package:app_nueva/screens/RegistroScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MiApp());
}



class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APP GASTRONOMICA"),
      actions: [IconButton(onPressed: ()=>(), icon:Icon(Icons.rocket_launch))],),
     body:botones(context),
    );
  }
}

 Widget botones(context){
return Column(children: [
  
  
   FilledButton(onPressed: ()=>irventana1(context), child: Text("desplegar informacion")),
   
     ElevatedButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginscreen(),)), child: Text("LOGIN")),
   
    ElevatedButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Registroscreen(),)), child: Text("REGISTRATE")),
  
    



    
 
],);

 }

 void irventana1(context){
  mostrarInfoModal(context);
 }

 void mostrarInfoModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
       
        title: Center( 
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.person, color: Colors.blue),
              SizedBox(width: 8),
              Text('Información del Estudiante'),
            ],
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre:Leandro Moreirs', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Docente:Ing.Julio Rosero'),
            Text('Carrera:Desarrollo de Software'),
            Text('Fecha: 06/12/2025'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}



