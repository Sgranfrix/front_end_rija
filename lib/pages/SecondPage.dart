import 'dart:html';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Model/Menagers/RestMenager.dart';
import '../Model/Model.dart';
import '../Model/Objects/DatiSportivi.dart';
import '../Model/support/Costanti.dart';
import 'package:path_provider/path_provider.dart';
import '../Widgets/InputField.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);


  @override
  _SecondPageState createState() => _SecondPageState();

}
class _SecondPageState extends State<SecondPage>{
  //late String token;


  TextEditingController nomeController = TextEditingController();
  TextEditingController durataController = TextEditingController();
  TextEditingController tipoAttivitaController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String? nomeFile;

  RestManager restManager = RestManager();


  @override
  void initState(){
    super.initState();
  }


 @override
 Widget build(BuildContext context) {
    print("Roberto");
    return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              InputField(
                labelText: "Inserisci il tuo nome utente",
                controller: nomeController, textAlign: TextAlign.center,
                /*controller: idController,
                decoration: InputDecoration(labelText: 'ID'),*/
              ),
              InputField(
                labelText: "Durata Allenamento",
                controller: durataController, textAlign: TextAlign.center,
                /*controller: durataController,
                decoration: InputDecoration(labelText: 'Durata'),
                keyboardType: TextInputType.number,*/
              ),
              InputField(
                labelText: "Tipo di allenamento",
                controller: tipoAttivitaController, textAlign: TextAlign.center,
                /*controller: tipoAttivitaController,
                decoration: InputDecoration(labelText: 'Tipo Attività'),*/
              ),
              InputField(
                labelText: "Note",
                controller: noteController, textAlign: TextAlign.center,
                /*controller: noteController,
                decoration: InputDecoration(labelText: 'Note'),*/
              ),
              /*ElevatedButton(
                onPressed: mandaDati,
                /*() {
                  print("PREMUTOOOOOOOOO");
                  mandaDati();
                },*/
                child: const Text('Invia'),
              ),*/
            //ElevatedButton(onPressed: mandaDati, child: const Text("Manda i tuoi dati"))
            ElevatedButton(
              onPressed: mandaDati,
              child: Text("Manda i dati")
            ),
            Padding(padding:
            EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(children: [
                TextButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      uploadFile(result.files.single.bytes!, result.files.single.name, nomeController.text);
                    }
                    else {
                      // Nessun file selezionato
                    }
                  },
                  child: Text('Seleziona un file da caricare in allegato ai tuoi dati sportivi'),
                ),
                /* TextButton(

                        onPressed: _downloadFolder,
                        child: Text("Download delle ricevute"))
*/
              ]
              ),
            ),
            ],
          ),
        )
      );
  }
  Future<void> uploadFile(List<int> fileData, String fileName, String nomeUtente) async {
    var url = Uri.parse('https://lazyhound.azurewebsites.net/api/datiSportivi/upload?fileName=' + fileName+"&"+"nomeUtente="+nomeUtente); // Sostituisci con l'URL del tuo endpoint di caricamento
    nomeFile=fileName;
    var response = await post(
      url,
      body: fileData,
      headers: {
        'Content-Type': 'application/octet-stream',
      },
    );

    if (response.statusCode == 200) {
      print('File caricato con successo');
    } else {
      print('Errore durante il caricamento del file');
    }
  }

  void mandaDati() async{
    final random= Random();

    int min=1;
    int max=10000;
    int randomNumber=min+ random.nextInt(max - min+1);

    print("CIAOOOOOOOOOOOOOOO");
    DatiSportivi datiSportivi = DatiSportivi(
      id: randomNumber.toString(),
      nomeUtente: nomeController.text,
      durata: int.parse(durataController.text),
      tipoAttivita: tipoAttivitaController.text,
      note: noteController.text,
    );
    //restManager.makePostRequest('localhost:8080', Costanti.REQUEST_ADD_DATI , datiSportivi);
    try {
      await Model.sharedInstance.addDatiSportivi(datiSportivi).then((result) {});
      setState(() {
        nomeController.text = "";
        durataController.text = "";
        tipoAttivitaController.text = "";
        noteController.text = "";
      });
      print(randomNumber);
    }
    catch(e) {
      print("qualcosa è andato storto: $e");
    }
    }
  }

