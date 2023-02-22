import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:jeju_app/model/login_signup.dart';
import 'package:jeju_app/view/join.dart';
import 'package:jeju_app/view/menu.dart';

class Terms extends StatefulWidget {
  final NaverAccountResult? naver;
  const Terms({super.key, required this.naver});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '약관동의',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 500,
              color: const Color.fromARGB(50, 195, 172, 152),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '약관에 동의하십니까?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (widget.naver != null) {
                      FlutterNaverLogin.logOutAndDeleteToken();
                    }
                  },
                  child: const Text(
                    '동의하지 않습니다',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (widget.naver != null) {
                      _naverJoin();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Join();
                          },
                        ),
                      );
                    }
                  },
                  child: const Text(
                    '동의합니다',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Functions

  //Desc: 네이버 회원가입
  //Date: 2023-02-22
  _naverJoin() async {
    String id = widget.naver!.id;
    String name = widget.naver!.name;
    String nickname = widget.naver!.nickname;
    String birth = '${widget.naver!.birthyear}-${widget.naver!.birthday}';
    String sex = widget.naver!.gender == 'M'
        ? '남자'
        : widget.naver!.gender == 'F'
            ? '여자'
            : '기타';
    String email = widget.naver!.email;

    LoginSignUp model = LoginSignUp();
    model.join(id, 'naver', '', name, nickname, email, sex, birth);

    _naverDialog();
  }

  //Desc: 네이버 회원가입 다이얼로그
  //Date: 2023-02-22
  _naverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '네이버 회원가입을 환영합니다.',
          ),
          content: const Text(
            '네이버 회원가입이 완료되었습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Menu();
                    },
                  ),
                );
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }
}
