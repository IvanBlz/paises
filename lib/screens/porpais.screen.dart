import 'dart:developer';
import 'package:paises/widgets/widgets.dart';

import 'package:flutter/material.dart';

class PorPaisScreen extends StatefulWidget {
  const PorPaisScreen({Key? key}) : super(key: key);

  @override
  State<PorPaisScreen> createState() => _PorPaisScreenState();
}

class _PorPaisScreenState extends State<PorPaisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // <-- Set it to false.
        appBar: AppBar(
          title: Text("Por País"),
          elevation: 0,
        ),
        body: SingleChildScrollView(child: SearchWidget()));
  }
}
