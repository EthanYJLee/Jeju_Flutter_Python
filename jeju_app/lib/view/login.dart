import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:jeju_app/model/login_signup.dart';
import 'package:jeju_app/view/menu.dart';
import 'package:jeju_app/view/terms.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // id, pw 입력 컨트롤러
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  late bool correctid;
  late bool correctpw;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Menu()),
                      ),
                    );
                  },
                  child: Text('home')),

              // ID 입력
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'ID를 입력하세요',
                  ),
                ),
              ),
              // Password 입력
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  controller: pwController,
                  decoration: const InputDecoration(
                    labelText: '비밀번호를 입력하세요',
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text(
                    '로그인',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _naverLogin();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Image.asset(
                    'images/btnW_완성형.png',
                    width: 200,
                    height: 100,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const Terms(naver: null)),
                    ),
                  );
                },
                child: const Text(
                  '회원가입',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final NaverLoginResult res = await FlutterNaverLogin.logOut();
                },
                child: const Text(
                  '로그아웃',
                ),
              ),
              TextButton(
                onPressed: () async {
                  FlutterNaverLogin.logOutAndDeleteToken();
                },
                child: const Text(
                  '연동 해제',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Functions

  //Desc: 로그인
  //Date: 2023-02-21
  _login() async {
    LoginSignUp model = LoginSignUp();
    bool check =
        await model.login(idController.text.trim(), pwController.text.trim());

    if (!mounted) return;
    if (check) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Menu();
          },
        ),
      );
    }
  }

  _naverLogin() async {
    final NaverLoginResult res = await FlutterNaverLogin.logIn();
    String id = res.account.id;

    if (res.status == NaverLoginStatus.loggedIn) {
      LoginSignUp model = LoginSignUp();
      bool check = await model.naverCheck(id);

      if (!mounted) return;
      if (check) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Menu();
            },
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Terms(naver: res.account);
            },
          ),
        );
      }
    }
  }
}
