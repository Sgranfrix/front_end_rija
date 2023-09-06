class DatiSportivi {

  String id;
  String nomeUtente;
  int durata;
  String tipoAttivita;
  String note;



  DatiSportivi({required this.id,required this.nomeUtente, required this.durata,required this.tipoAttivita,required this.note});

  factory DatiSportivi.fromJson(Map<String, dynamic> json) {
    /*List<DatiSportivi> ld = List<DatiSportivi>.from(json['dati'].map((i) =>
        DatiSportivi.fromJson(i as Map<String, dynamic>)).toList());*/

    return DatiSportivi(
      id: json['id'],
      nomeUtente: json['nomeUtente'],
      durata: json['durata'],
      tipoAttivita: json['tipoAttivita'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'nomeUtente': nomeUtente,
        'durata': durata,
        'tipoAttivita': tipoAttivita,
        'note': note,
      };

  @override
  String toString() {
    return nomeUtente+ " " + tipoAttivita;
  }

  int getDurata(){
    return this.durata;
  }

}