import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jeju_app/view/menu.dart';

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
    //--
  }
}
