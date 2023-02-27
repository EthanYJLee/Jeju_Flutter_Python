import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:jeju_app/model/login_signup.dart';
import 'package:jeju_app/model/message.dart';
import 'package:jeju_app/view/menu.dart';
import 'package:jeju_app/view/search_id.dart';
import 'package:jeju_app/view/search_pw.dart';
import 'package:jeju_app/view/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    correctid = false;
    correctpw = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _confirmQuit(context);
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ID 입력
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: 'ID를 입력하세요',
                    ),
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        setState(() {
                          correctid = true;
                        });
                      } else {
                        correctid = false;
                      }
                    },
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
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        setState(() {
                          correctpw = true;
                        });
                      } else {
                        correctpw = false;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: ElevatedButton(
                    onPressed: correctid && correctpw
                        ? () {
                            _login();
                          }
                        : null,
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
                //여기서부터 디버그/테스트용 위젯
                TextButton(
                  onPressed: () async {
                    final NaverLoginResult res =
                        await FlutterNaverLogin.logOut();
                  },
                  child: const Text(
                    '로그아웃',
                  ),
                ),
                // TextButton(
                //   onPressed: () async {
                //     FlutterNaverLogin.logOutAndDeleteToken();
                //   },
                //   child: const Text(
                //     '연동 해제',
                //   ),
                // ),
                // TextButton(
                //   onPressed: () async {
                //     _disposeSharedPreferences();
                //   },
                //   child: const Text(
                //     'SF 초기화',
                //   ),
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchId()));
                  },
                  child: const Text(
                    '아이디 찾기',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPw()));
                  },
                  child: const Text(
                    '비밀번호 찾기',
                  ),
                ),
              ],
            ),
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
    String name =
        await model.login(idController.text.trim(), pwController.text.trim());

    if (!mounted) return;
    if (name.isNotEmpty) {
      _loginsuccessdialog(name, idController.text.trim());
    } else {
      _loginFailDialog();
    }
  }

  //Desc: 네이버 로그인
  //Date: 2023-02-22
  _naverLogin() async {
    final NaverLoginResult res = await FlutterNaverLogin.logIn();
    String id = res.account.id;

    if (res.status == NaverLoginStatus.loggedIn) {
      LoginSignUp model = LoginSignUp();
      String? name = await model.naverCheck(id);

      if (!mounted) return;
      if (name.isNotEmpty) {
        _loginsuccessdialog(name, id);
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

  //Desc: 로그인 성공 다이얼로그
  //Date: 2023-02-22
  _loginsuccessdialog(String name, String id) {
    _saveId(id, name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text(
              '로그인 성공',
            ),
            content: Text(
              '환영합니다, $name님!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
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
            ]);
      },
    );
  }

  //Desc: 로그인 실패 다이얼로그
  //Date: 2023-02-22
  _loginFailDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text(
              '로그인 실패',
            ),
            content: const Text(
              'ID와 비밀번호를 확인해 주세요.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '확인',
                ),
              ),
            ]);
      },
    );
  }

  //Desc: ID와 이름을 Shared Preferences에 저장
  //Date: 2023-02-22
  _saveId(id, name) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('uId', id);
    pref.setString('uName', name);
    Message.uName = '$name';
    print(Message.uName);
  }

  //Desc: Shared Preferences 초기화
  //Date: 2023-02-22
  static _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  //Desc: 앱 종료 확인
  //Date: 2023-02-22
  _confirmQuit(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '앱 종료',
          ),
          content: const Text(
            '앱을 종료하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
              ),
            ),
            TextButton(
              onPressed: () {
                _disposeSharedPreferences();
                Navigator.of(context).pop();
                SystemNavigator.pop();
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
