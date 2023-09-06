import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
/*import 'package:flutter_azure_b2c/B2CConfiguration.dart';
import 'package:flutter_azure_b2c/B2COperationResult.dart';
import 'package:flutter_azure_b2c/flutter_azure_b2c.dart';*/
import 'package:http/http.dart' as http;
import 'ClasseGlobale.dart';
import 'pages/Layout.dart';
import 'pages/LoginPage.dart';
import 'Model/Menagers/RestMenager.dart';
import 'Model/Objects/DatiSportivi.dart';
import 'package:msal_flutter/msal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import "Model/support/Costanti.dart";
import 'pages/Prova.dart';
import 'pages/SecondPage.dart';
import 'Widgets/InputField.dart';



void main() {
  // Configurazione di MsalMobile
  /*MsalMobile.create(
    MsalConfig(
      clientId: 'your-client-id',
      authority: 'https://login.microsoftonline.com/your-tenant-id',
      redirectUri: 'your-redirect-uri',
    ),
  );*/
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String? token;
  static MyApp sharedInstance = MyApp();
  ClasseGlobale classeGlobale = ClasseGlobale();

  RestManager restManager = RestManager();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyHound',
      initialRoute: "/",
      routes: {
        "/": (context)=>LoginPage(),
        "/welcome": (context)=> Layout(null,null),
      },
      onGenerateRoute: (settings) {
        Uri uri = Uri.parse(settings.name!);
        String path = uri.path;
        Map<String, String> params = uri.queryParameters;
        if (path == '/welcome') {
            print("AAAAAAAAAAAAAAAAAAAAAA");
            return MaterialPageRoute(
              builder: (context) {
                print(params['email']);
                print(params['give_name']);
                this.token=params['token'];
                classeGlobale.token = params['token']!;
                print(classeGlobale.token);
                print(token);
                print(params['token']);

                String email = params['email'].toString();
                print(params['email']);
                //return Prova(name: params['name']!, email: params['email']!);
                return Layout("prova",null);
              },
            );
          }
        }
        /*theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lazy Hound'),;
    );*/
    );
  }
  String? getToken(){
    return this.token;
  }

}


/*class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => _SecondPageState();

}
  // Important: Remeber to handle redirect states (if you want to support
  // the web platform with redirect method) and init the AzureB2C plugin
  // before the material app starts.

  /*Future<void> inviaDatiSportivi(DatiSportivi datiSportivi) async {
    String url = 'http://localhost:8080/api/datiSportivi/aggiungi';

    try {
      String requestBody = json.encode(datiSportivi);
      print("CAVALLOOOOOOOOOO");
      Map<String, String> headers = Map();
      /*headers[HttpHeaders.contentTypeHeader] = "application/json";
      headers[HttpHeaders.authorizationHeader] = 'bearer $token';*/
      http.Response response = await http.post(
        Uri.parse(url),
        //headers: headers,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $token'
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print('Dati sportivi inviati con successo!');
      } else {
        print(
            'Errore durante l invio dei dati sportivi. Status code: ${response
                .statusCode}');
      }
    } catch (error) {
      print('Errore durante la comunicazione con il backend: $error');
    }
  }*/

class _SecondPageState extends State<SecondPage>{
  late String token;

  final TextEditingController idController = TextEditingController();
  final TextEditingController durataController = TextEditingController();
  final TextEditingController tipoAttivitaController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  RestManager restManager = RestManager();

  @override
  Widget build(BuildContext context) {
    print("CIAO");
    return MaterialApp(
      title: 'DatiSportivi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DatiSportivi'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: durataController,
                decoration: InputDecoration(labelText: 'Durata'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: tipoAttivitaController,
                decoration: InputDecoration(labelText: 'Tipo Attività'),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Note'),
              ),
              ElevatedButton(
                onPressed: () async {
                  print("PREMUTOOOOOOOOO");
                  mandaDati();
                  /*String id = idController.text;
                  int durata = int.parse(durataController.text);
                  String tipoAttivita = tipoAttivitaController.text;
                  String note = noteController.text;
                  DatiSportivi datiSportivi = DatiSportivi(
                    id: idController.text,
                    durata: int.parse(durataController.text),
                    tipoAttivita: tipoAttivitaController.text,
                    note: noteController.text,
                  );
                  //inviaDatiSportivi(datiSportivi);
                 restManager.makePostRequest('http://localhost:8080', Costanti.REQUEST_ADD_DATI , datiSportivi);*/
                },
                child: const Text('Invia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void mandaDati(){
    print("CIAOOOOOOOOOOOOOOO");
    DatiSportivi datiSportivi = DatiSportivi(
      id: idController.text,
      durata: int.parse(durataController.text),
      tipoAttivita: tipoAttivitaController.text,
      note: noteController.text,
    );
    restManager.makePostRequest('http://localhost:8080', Costanti.REQUEST_ADD_DATI , datiSportivi);
  }

}
*/

class MyHomePage extends StatefulWidget {
  MyHomePage ({ required this.name});
  dynamic name;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  dynamic _name;


  @override
  void initState() {
    super.initState();
    _name = widget.name;
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        body: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('/Users/sgranfrix/Desktop/Assets/Logo_Lazy_Hound.png'), // Percorso dell'immagine
              fit: BoxFit.cover, // Imposta la modalità di adattamento dell'immagine
            ),
          ),
          child: Center(
            child: Text(
              'WELCOME!',
              style: TextStyle(color: Colors.blue, fontSize: 50.0),
            ),
          ),
        ),
        appBar: AppBar(
          leading: Image.asset(
              "/Users/sgranfrix/Desktop/Assets/Logo_Lazy_Hound.png"),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Primary Page"),
        ),
    );
  }
}
