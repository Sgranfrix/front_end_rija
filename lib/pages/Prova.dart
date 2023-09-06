import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Layout.dart';




class Prova extends StatefulWidget{
  /*String email;
  String name;*/

  @override
  _ProvaState createState() => _ProvaState();

  Prova();


}
class _ProvaState extends State<Prova> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestione acquisti',
      initialRoute: '/',
      routes: {
        '/': (context) => Layout("cacca", "pipì"),
      },
    );
  }
}