
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_rija/Model/Objects/DatiSportivi.dart';

import '../Model/Objects/DatiSportivi.dart';

class DatiCard extends StatelessWidget{

  final DatiSportivi dati;


  DatiCard({Key? key, required this.dati}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(dati.nomeUtente);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Nome Utente:', dati.nomeUtente),
            _buildInfoRow('Durata allenamento:', '${dati.durata.toString()} minuti'),
            _buildInfoRow("Tipo dell'attività svolta:", dati.tipoAttivita),
            _buildInfoRow("Note sull'allenamento:", dati.note),
            Container(
            height:50.0,
              width: dati.durata.toDouble()*4,
            color: Colors.blue, // Puoi personalizzare il colore a tuo piacimento
            margin: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  dati.durata.toString()+"minuti",
                  style: TextStyle(
                    color: Colors.white, // Colore del testo
                    fontSize: 20.0, // Dimensione del testo
                  ),
                ),
            ),
            ),// Spazio tra i rettangoli
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            value!,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),

        ],
      ),
    );
  }

}