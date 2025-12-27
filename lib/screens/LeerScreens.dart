import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeerScreens extends StatelessWidget {
  const LeerScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: lista(),
    );
  }
}

//leer lista
Future<List> leerlista() async {
  List estudiantesList = [];

  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('estudiantes');

  final snapshot = await starCountRef.get();
  final data = snapshot.value;

  if (data != null) {
    Map mapData = data as Map;

    mapData.forEach(
      (clave, valor) => estudiantesList.add({
        'cedula': clave,
        'nombre': valor['nombre'],
        'edad': valor['edad'],
        'telefono': valor['telefono'],
      }),
    );
  }

  return estudiantesList;
}

Widget lista() {
  return FutureBuilder(future: leerlista(), builder: (context, snapshot){
    if (snapshot.hasData) {
      List data = snapshot.data!;

      return ListView.builder( itemCount:data.length, itemBuilder:(context, index) {
        final item = data[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.zero,
          
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
          
          
          
          
          
            child: ListTile(
              title: Text("Cedula${item['cedula']}"),
              subtitle: Text(item['nombre']),


              trailing: IconButton(
                onPressed: ()=>eliminar(item['cedula'],context),
                 icon: Icon(Icons.delete)),
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.gamepad_rounded)),
            
            ),
          ),
        );

      },);

    }else{
      return CircularProgressIndicator();
    }
  },);
}

Future<void> eliminar(cedula,context) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("estudiantes/$cedula");

await ref.remove ();
//mejorar
Navigator.push(context, MaterialPageRoute
(builder: (context) => LeerScreens()));

}
