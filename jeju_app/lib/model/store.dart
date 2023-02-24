import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class Store {
  //가게select
  Future<List> storeSelect(String uId) async {
    String url = 'http://localhost:8080/storeSelect?uId=$uId';
    var uri = Uri.parse(url);
    var result = await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));

    List storeResult = dataConvertedJson['results'];

    // print(storeResult);
    return storeResult;
  }

  //가게 add
  Future<bool> storeAdd(
      String sName,
      String sCategory,
      String sDong,
      String sTel,
      String sAddress,
      String user_uId,
      String user_uIdType) async {
    String url =
        'http://localhost:8080/storeAdd?sName=$sName&sCategory=$sCategory&sDong=$sDong&sTel=$sTel&sAddress=$sAddress&user_uId=$user_uId&user_uIdType=$user_uIdType';
    var uri = Uri.parse(url);
    http.get(uri);
    return true;
  }

  //가게 Update
  Future<bool> storeUpdate(String sName, String sCategory, String sDong,
      String sTel, String sAddress, int sId) async {
    String url =
        'http://localhost:8080/storeUpdate?sName=$sName&sCategory=$sCategory&sDong=$sDong&sTel=$sTel&sAddress=$sAddress&sId=$sId';
    var uri = Uri.parse(url);
    http.get(uri);
    return true;
  }

  //가게 Delete
  Future<bool> storeDelete(int sId) async {
    String url = 'http://localhost:8080/storeDelete?sId=$sId';
    print(url);
    var uri = Uri.parse(url);
    http.get(uri);
    return true;
  }
}
