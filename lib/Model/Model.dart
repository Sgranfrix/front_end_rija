import 'dart:convert';




import '../Utility/Costanti.dart';
import 'Menagers/RestMenager.dart';
import 'Objects/DatiSportivi.dart';

class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();




  Future<List<DatiSportivi>?> getDati(String nome) async{
    Map<String, String> params = Map();
    params["nome"] = nome;
    return List<DatiSportivi>.from(json.decode(await _restManager.makeGetRequest(Costanti.ADDRESS_SERVER, Costanti.pathGetId, params)).map((i) => DatiSportivi.fromJson(i)).toList());
  }

  /*uture<List<PerCategoria>> getCategorie(String email) async{
    Map<String, String> params = Map();
    params["email"] = email;

    return List<PerCategoria>.from(json.decode(await _restManager.makeGetRequest(Constants.serverAddress, Constants.pathSearchCategorie, params)).map((i) => PerCategoria.fromJson(i)).toList());

  }*/


  Future<void> addDatiSportivi(DatiSportivi d) async{
    String rawResult  = await _restManager.makePostRequest(Costanti.ADDRESS_SERVER, Costanti.REQUEST_ADD_DATI, d);
    /*if (!rawResult.contains("Added sucessful!")) {
      return false;
    }
    return true;*/
    return null;
  }



  Future<void> download(String folderName) async{
    Map<String, String> params = Map();
    params["folderName"] = folderName;
    await _restManager.makeGetRequest(Costanti.ADDRESS_SERVER, Costanti.path_download, params);
    //await _restManager.makeGet2Request("localhost:8080", Costanti.path_download, params);

  }

  /*Future<void> downloadFile(String fileName, String email) async{
    Map<String, String> params = Map();
    params["folderName"] = fileName;
    params["email"] = email;
    await _restManager.makeGetRequest(Costanti.ADDRESS_SERVER, Constants.pathDownloadFile, params);
  }*/

}