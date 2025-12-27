import 'package:flutter/material.dart';
import 'package:app_nueva/screens/GuardarScreen.dart';
import 'package:app_nueva/screens/LeerScreens.dart';

class NavegadorTabs extends StatefulWidget {
  const NavegadorTabs({super.key});
  @override
  State<NavegadorTabs> createState() => _NavegadorTabsState();
}

class _NavegadorTabsState extends State<NavegadorTabs> {
  int _indice = 0;
  List<Widget> pantallas = [ Guardarscreen(), LeerScreens()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pantallas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (indice) {
          setState(() { _indice = indice; });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Gastronomía"),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "Ciudades"),
        ],
      ),
    );
  }
}