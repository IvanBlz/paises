import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paises"),
        elevation: 0,
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ListTile(
          //   leading: Icon(Icons.map),
          //   title: Text("Mapa"),
          //   onTap: () {
          //     Navigator.pushNamed(context, "/map", arguments: "Mapa");
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.location_searching),
            title: Text("Por país"),
            onTap: () {
              Navigator.pushNamed(context, "/porpais", arguments: "pais");
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Por región"),
            onTap: () {
              Navigator.pushNamed(context, "/porregion", arguments: "region");
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("Por capital"),
            onTap: () {
              Navigator.pushNamed(context, "/porcapital", arguments: "capital");
            },
          ),
        ],
      )),
    );
  }
}
