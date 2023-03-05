

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../social_login.dart';

class KakaoModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  KakaoModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.Login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.Logout();
    isLogined = false;
    user = null;
  }
}
