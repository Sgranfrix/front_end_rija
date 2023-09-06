/*import '../../model/object/User.dart';
import 'AddPurchase2.dart';
import 'Graphic.dart';
import 'PurchasePage.dart';
import 'UserPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'PaginaDati.dart';
import 'SecondPage.dart';
import '../main.dart';
import 'VisualizzaDati.dart';

class Layout extends StatefulWidget {
  dynamic name;
  //User user;
  dynamic email;

  @override
  _LayoutState createState() => _LayoutState();


  Layout(this.name, this.email);
}

class _LayoutState extends State<Layout> {
  dynamic _name;
  dynamic _email;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                'Gestione acquisti'
            ),
            backgroundColor:Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                //bottom: Radius.circular(30),
              ),
            ),
            //title: Text('Flutter App'),
            bottom: TabBar(
              tabs: [
                Tab(text: "Home", icon: Icon(Icons.home_rounded)),

                Tab(text: "Inserisci Dati", icon: Icon(Icons.sports)),

                Tab(text: "Visualizza Dati", icon: Icon(Icons.data_array))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MyHomePage(name: _name,),
              SecondPage(),
              //PaginaDati(),
              VisualizzaDati(),
            ],
          ),
        )
    );
  }

}