class Costanti{
  static final String RESPONSE_CORRECT_ADD="Aggiunto con successo";
  static const String authority="serviziob2c.b2clogin.com";
  static const String pathLoginB2C="/serviziob2c.onmicrosoft.com/oauth2/v2.0/authorize";
  static const String client_id="ab08ec79-5edd-427b-99fd-1afb2805b60f";
  static const String redirect_uri="http://localhost:8080/api/User/aggiungi";
  //static const String redirect_uri="https://lazyhound.azurewebsites.net/api/User/aggiungi";
  static const String userFlowName="B2C_1_utenti-app";
  static const String ADDRESS_SERVER="localhost:8080";
  //static const String ADDRESS_SERVER="lazyhound.azurewebsites.net";
  static const String REQUEST_ADD_DATI = "/api/datiSportivi/aggiungi";
  static const String path_download="/api/datiSportivi/download";
//scrivere --web-port=4200
  static const Map<String, String> queryParams = {
    "p": Costanti.userFlowName,
    "client_id": Costanti.client_id,
    "nonce": "defaultNonce",
    "redirect_uri": Costanti.redirect_uri,
    "scope": "openid",
    "response_type": "id_token",
    "response_mode": "query",
    "prompt": "login",
  };
  static const String pathGetId = "/api/datiSportivi/get/id";
}
