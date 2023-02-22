import 'dart:convert';

import 'package:http/http.dart' as http;

import '../util/shared.dart';

class LoginSignUp {
  //Desc: 로그인
  //Date: 2023-02-21
  Future<String> login(String uId, String uPassword) async {
    String url='http://${Shared.ipAddress}:8080/login?uId=$uId&uPassword=$uPassword';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    String name=dataConvertedJson['results'][0]['uName'];

    return name;
  }

  //Desc: 회원가입
  //Date: 2023-02-21
  Future<bool> join(String uId, String uIdType, String uPassword, String uName, String uNickname,
      String uEmail, String uSex, String uBirth) async {
    String url='http://${Shared.ipAddress}:8080/join?uId=$uId&uIdType=$uIdType&uPassword=$uPassword&uNickname=$uNickname&uEmail=$uEmail&uSex=$uSex&uBirth=$uBirth&uName=$uName';
    var uri=Uri.parse(url);
    http.get(uri);
    return true;
  }

  //Desc: ID 중복체크
  //Date: 2023-02-22
  Future<bool> idCheck(String uId) async{

    String url='http://${Shared.ipAddress}:8080/idcheck?uId=$uId';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    int check=dataConvertedJson['results'][0]['check'];

    if (check==0){
      return false;
    } else{
      return true;
    }
  }

  //Desc: 네이버로 회원가입되어있는지 확인
  //Date: 2023-02-22
  Future<String> naverCheck(String uId) async{
    String url='http://${Shared.ipAddress}:8080/navercheck?uId=$uId';
    var uri=Uri.parse(url);
    var result=await http.get(uri);
    var dataConvertedJson = json.decode(utf8.decode(result.bodyBytes));
    String name=dataConvertedJson['results'][0]['check'];

    return name;
  }

}
