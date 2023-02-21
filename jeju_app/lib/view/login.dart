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
  late TextEditingController idController = TextEditingController();
  late TextEditingController pwController = TextEditingController();

  // 텍스트필드 외의 화면을 눌렀을 때 텍스트필드의 Focus를 해제하기 위해 FocusNode 선언
  FocusNode idFocus = FocusNode();
  FocusNode pwFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: TextField(
              controller: idController,
              focusNode: idFocus,
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
              focusNode: pwFocus,
              decoration: const InputDecoration(
                labelText: '비밀번호를 입력하세요',
              ),
              obscureText: true,
            ),
          ),
        ],
      )),
    );
  }
}
