import 'package:flutter/material.dart';
import 'package:paises/widgets/widgets.dart';

class PorCapitalScreen extends StatefulWidget {
  const PorCapitalScreen({Key? key}) : super(key: key);

  @override
  State<PorCapitalScreen> createState() => _PorCapitalScreenState();
}

class _PorCapitalScreenState extends State<PorCapitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // <-- Set it to false.
        appBar: AppBar(
          title: Text("Por Capital"),
          elevation: 0,
        ),
        body: SingleChildScrollView(child: SearchWidget()));
  }
}
