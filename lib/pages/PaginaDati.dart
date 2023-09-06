import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SecondPage.dart';

class PaginaDati extends StatefulWidget {
  //dynamic email;

  PaginaDati();
  @override
  PaginaDatiState createState() => PaginaDatiState();

}

class PaginaDatiState extends State<PaginaDati> {

  bool inserisciDati=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      inserisciDati=true;
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.green; // Colore quando il pulsante è premuto
                        // Colore quando il pulsante non è premuto
                      }),
                    ),
                    child: Text('Inserisci Acquisto'),
                  ),
                  /* SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isMostraAcquistiPressed = false;
                        isMostraInserimentoAcquistoPressed = false;
                        isDownloadRicevutePressed = true;
                      });
                      _downloadFolder();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        if (isDownloadRicevutePressed) {
                          return Colors.green; // Colore quando il pulsante è premuto
                        }
                        return Colors.indigo; // Colore quando il pulsante non è premuto
                      }),
                    ),
                    child: Text("Download delle ricevute"),
                  ),*/
                ],
              ),
              if (inserisciDati)
                SecondPage(),
            ],
          ),
        ),
      ),
    );
  }

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: mostraAcquisti,
                    child: Text('Mostra Acquisti'),
                  ),
                  SizedBox(width: 25), // Spazio tra i bottoni
                  ElevatedButton(
                    onPressed: mostraInserimentoAcquisto,
                    child: Text('Inserisci Acquisto'),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(

                      onPressed: _downloadFolder,
                      child: Text("Download delle ricevute"))
                ],
              ),
              if (showAcquisti && purchase != null)
                ListaAcquistiWidget(purchase),
              if (showInserimentoAcquisto)
                AddPurchase2(_email),
            ],
          ),
        ),
      ),
    );
  }*/

}



/*class ListaAcquistiWidget extends StatelessWidget {
  List<Acquisto>? purchase;
  ListaAcquistiWidget(this.purchase, {super.key});

  @override
  Widget build(BuildContext context) {
    // Logic per mostrare la lista degli acquisti
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: purchase?.length,
          itemBuilder: (context, index) {
            if (purchase!.isNotEmpty){
              return PurchaseCard(
                acquisto: purchase![index],
              );}
            else{
              return SnackBar(content: Text(
                  "Non ci sono acquisti da visualizzare"),
                backgroundColor: Colors.blueAccent,);
            }
          },
        ),
      ),
    );
  }
}*/
/*
class InserimentoAcquistoWidget extends StatelessWidget{

 _InserimentoAcquistoWidgetState createState() => _InserimentoAcquistoWidgetState();
}
class _InserimentoAcquistoWidgetState extends State<InserimentoAcquistoWidget> {


  TextEditingController acquistoP = TextEditingController();
  TextEditingController descrizione = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController prezzo = TextEditingController();
  TextEditingController annoFiscale = TextEditingController();

  bool _addingPurchase = false;
  bool _addedPurchase = false;
  Acquisto? _justAddedPurchase;*/

@override
Widget build(BuildContext context) {
  // Logic per mostrare le caselle di inserimento
  return Expanded(
    child: Container(
      color: Colors.blue,
      child: Center(
        child: Text('Inserisci un Acquisto'),
      ),
    ),
  );
}






