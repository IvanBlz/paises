import 'package:flutter/material.dart';
import 'package:paises/widgets/widgets.dart';

class PorRegionScreen extends StatefulWidget {
  const PorRegionScreen({Key? key}) : super(key: key);

  @override
  State<PorRegionScreen> createState() => _PorRegionScreenState();
}

class _PorRegionScreenState extends State<PorRegionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // <-- Set it to false.
        appBar: AppBar(
          title: Text("Por Región"),
          elevation: 0,
        ),
        body: SingleChildScrollView(child: SearchWidget()));
  }
}
