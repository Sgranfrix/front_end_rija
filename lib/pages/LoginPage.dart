import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../Utility/Costanti.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /*@override
  void initState() {
    super.initState();
    // Qui puoi inserire la logica o le chiamate di funzioni che desideri eseguire automaticamente
    // ad esempio, puoi chiamare la funzione per aprire una pagina di login
    _login();
  }*/

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lazy Hound")),
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: Text("Fai il log in"),
        )
      )

    );
  }


  void _login() async {
    Map<String, String> value = {
    "p": Costanti.userFlowName,
    "client_id": Costanti.client_id,
    "nonce": "defaultNonce",
    "redirect_uri": Costanti.redirect_uri,
    "scope": "openid",
    "response_type": "id_token",
    "response_mode": "query",
    "prompt": "Login"
    };
    Uri uri = Uri.https(Costanti.authority, Costanti.pathLoginB2C, value);
    await launchUrl(uri);
  }


}