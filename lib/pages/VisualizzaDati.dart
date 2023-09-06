
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_rija/Model/Objects/DatiSportivi.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Model/Menagers/RestMenager.dart';
import '../Model/Model.dart';
import '../Model/Objects/DatiSportivi.dart';
import '../Widgets/DatiCard.dart';
import '../Widgets/InputField.dart';


class VisualizzaDati extends StatefulWidget {
  const VisualizzaDati({Key? key}) : super(key: key);


  @override
  VisualizzaDatiState createState() => VisualizzaDatiState();

}

class VisualizzaDatiState extends State<VisualizzaDati> {
  late String token;
  bool datiCercati=false;
  TextEditingController idController = TextEditingController();

  List<DatiSportivi>? datiRaccolti;

  RestManager restManager = RestManager();

  @override
  void initState() {
    super.initState();
  }

  void mostraAcquisti(String id) async{
    print("STO PRENDENDO I DATI");
    await Model.sharedInstance.getDati(id).then((result)  {
      datiRaccolti=result!;
      print("HO PRESO I DATIIIIII");
    });
    setState(() {
      idController.text = "";
      datiCercati=true;
    });
    //print(datiRaccolti);
  }



  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Esempio di App Flutter'),
        ),
        body: Column(
          children: [
            InputField(
              labelText: "Inserisci qui il tuo Id per trovare i tuoi Dati di Allenamento",
              controller: idController, textAlign: TextAlign.center,
            ),
          ElevatedButton(
           onPressed: () {
            //mostraAcquisti(idController.text);
            Model.sharedInstance.getDati(idController.text).then((result)  {
              datiRaccolti=result!;
              print("HO PRESO I DATIIIIII");
              setState(() {
                datiCercati=true;
                idController.text="";
              });
            });
          },
           child: Text("cerca")
          ),
            ElevatedButton(
                onPressed: () {
                  //mostraAcquisti(idController.text);
                  _downloadFolder();
                },
                child: Text("scarica i tuoi file associati alle tue attività")
            ),

            // Aggiungi il tuo widget personalizzato alla gerarchia dell'interfaccia utente
            if(datiCercati)
              ListaDatiWidget(datiRaccolti), // Questa riga aggiunge MyWidget alla colonna
          ],
        ),
      ),
    );
  }




  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment:FractionalOffset.bottomCenter,
        child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            children:[
            InputField(
                    labelText: "Inserisci qui il tuo Id per trovare i tuoi Dati di Allenamento",
                    controller: idController, textAlign: TextAlign.center,
             ),
            ElevatedButton(
              onPressed: () {
                //mostraAcquisti(idController.text);
                Model.sharedInstance.getDati(idController.text).then((result)  {
                  datiRaccolti=result!;
                  print("HO PRESO I DATIIIIII");
                });
                ListaDatiWidget(datiRaccolti);
              },
              child: Text("Cerca")
            ),
          ],
        ),
      ),
    ),
    );

  }*/

  void lanciaFinestra(){
    print("STO LANCIANDO LA FINESTRAAAAAAA");
    ListaDatiWidget(datiRaccolti);
  }
  void _downloadFolder() async {
    Model.sharedInstance.download(idController.text); // Sostituisci con l'URL del tuo endpoint di caricamento
  }



}
class ListaDatiWidget extends StatelessWidget {
  List<DatiSportivi>? dati;
  ListaDatiWidget(this.dati, {super.key});

  @override
  Widget build(BuildContext context) {
    print("COSTRUISCOOOOOOOOOO");
    // Logic per mostrare la lista degli acquisti
    List<double> durate = [];
    return Expanded(
      child: SingleChildScrollView(
      child:Column(
        children: [
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dati?.length,
                itemBuilder: (context, index) {
                  if (dati!.isNotEmpty){
                    if(dati![index].getDurata() is! String) {
                      DatiSportivi dato=dati![index];
                      durate.add(dato.getDurata().toDouble());
                      print(durate[index]);
                    }
                   return DatiCard(
                      dati: dati![index],
                    );}

                  else{
                    return SnackBar(content: Text(
                        "Non ci sono dati da visualizzare"),
                      backgroundColor: Colors.blueAccent,);
                  }
               },
              ),

        ),


        /*BarChart(
            BarChartData(
              maxY: 100,
              barGroups: durate.where((double value) => !value.isInfinite)
                          .map((double value) {
                return BarChartGroupData(
                      x: durate.indexOf(value), // Indice dell'elemento come posizione sulla X
                      barRods: [
                          BarChartRodData(
                                 toY: value, // Altezza della colonna
                          ),
                      ],
                );
                }).toList(),
          ),
        ),*/
    ],
      ),
      ),
    );
  }
}