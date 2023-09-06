import 'dart:io';
import 'dart:convert';
import 'package:front_end_rija/main.dart';
import 'package:http/http.dart';

import '../../ClasseGlobale.dart';


enum TypeHeader {
  json,
  urlencoded
}


class RestManager {
  //ErrorListener delegate;
  ClasseGlobale classeGlobale = ClasseGlobale();
  late String token= classeGlobale.token;
  //late String? token= MyApp.sharedInstance.token;
  /*void setToken(String token){
    this.token=token;
  }*/

  Future<String> _makeRequest(String serverAddress, String servicePath, String method, TypeHeader type, {Map<String, String>? value, dynamic body}) async {
    Uri uri2=Uri.http(serverAddress,servicePath,value);
    Uri uri = Uri.http(serverAddress,servicePath,value);
    bool errorOccurred = false;
    while ( true ) {
      try {
        var response;
        // setting content type
        String contentType ="";
        dynamic formattedBody;
        if ( type == TypeHeader.json ) {
          contentType = "application/json;charset=utf-8";
          formattedBody = json.encode(body);
        }
        else if ( type == TypeHeader.urlencoded ) {
          contentType = "application/x-www-form-urlencoded";
          formattedBody = body.keys.map((key) => "$key=${body[key]}").join("&");
        }
        // setting headers
        Map<String, String> headers = Map();
        headers[HttpHeaders.contentTypeHeader] = contentType;
        if ( token != null ) {
          headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
          print(headers);
        }
        // making request
        switch ( method ) {
          case "post":
            response = await post(
              uri,
              headers: headers,
              body: formattedBody,
            );
            break;
          case "get2":
            response = await get(
            uri2,
            headers: headers,
            );
            break;
          case "get":
            response = await get(
              uri,
              headers: headers,
            );
            print("GGGGGGGGGGGGGGGGGGGGGGGGg");
            break;
          case "put":
            response = await put(
              uri,
              headers: headers,
            );
            break;
          case "delete":
            response = await delete(
              uri,
              headers: headers,
            );
            break;
        }
        /*if ( delegate != null && errorOccurred ) {
          delegate.errorNetworkGone();
          errorOccurred = false;
        }*/
        print(response.body.toString());
        return response.body;
      } catch(err) {
        /*if ( delegate != null && !errorOccurred ) {
          delegate.errorNetworkOccured(Constants.MESSAGE_CONNECTION_ERROR);
          errorOccurred = true;
        }*/
        await Future.delayed(const Duration(seconds: 5), () => null); // not the best solution
      }
    }
  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value, {TypeHeader type = TypeHeader.json}) async {
    print("EEEEEEEEEEEEE");
    print(token);
    return _makeRequest(serverAddress, servicePath, "post", type, body: value);
  }

  Future<String> makeGetRequest(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    print("EEEEEEEEEEEEE");
    return _makeRequest(serverAddress, servicePath, "get", TypeHeader.json, value: value);
  }

  Future<String> makeGet2Request(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    print("EEEEEEEEEEEEE");
    return _makeRequest(serverAddress, servicePath, "get2", TypeHeader.json, value: value);
  }

  Future<String> makePutRequest(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    return _makeRequest(serverAddress, servicePath, "put", type!, value: value);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    return _makeRequest(serverAddress, servicePath, "delete", type!, value: value);
  }



}
