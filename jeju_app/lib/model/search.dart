import 'dart:convert';

import 'package:http/http.dart' as http;

import '../util/shared.dart';

class SearchIdPw {
  // 아이디 찾기(2023-02-22)
  Future<String> searchid(String uName, String uEmail) async {
    String url='http://${Shared.ipAddressmac}/SearchId?uName=$uName&uEmail=$uEmail';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    print(dataConvertedJson);
    String check=dataConvertedJson['results'][0]['check'];

    return check;
  }

  // 비밀번호 찾기(2023-02-23)
  Future<String> searchpw(String uName, String uId, String uEmail) async {
    String url='http://${Shared.ipAddressmac}/SearchPw?uName=$uName&uid=$uId&uEmail=$uEmail';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    print(dataConvertedJson);
    String check2=dataConvertedJson['results'][0]['check2'];
    
    return check2;

  }

  // 비밀번호 바꾸기(2023-02-23)
  Future<bool> updatepw(String uPassword,String uid) async {
    // String url='http://${Shared.ipAddress}:8080/login?uName=$uName&uId=$uId&uEmail=$uEmail';
    String url='http://${Shared.ipAddressmac}/UpdatePw?uPassword=$uPassword&uid=$uid';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    print(dataConvertedJson);

      return true;
  }

}