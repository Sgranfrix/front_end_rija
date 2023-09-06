class ClasseGlobale {
  static final ClasseGlobale _instance = ClasseGlobale._internal();

  factory ClasseGlobale() {
    return _instance;
  }

  ClasseGlobale._internal();

  // Aggiungi le variabili che vuoi condividere
  String token = '';

}