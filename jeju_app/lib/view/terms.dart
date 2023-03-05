import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jeju_app/kakao_login.dart';
import 'package:jeju_app/model/kakao_model.dart';
import 'package:jeju_app/model/login_signup.dart';
import 'package:jeju_app/model/message.dart';
import 'package:jeju_app/view/join.dart';
import 'package:jeju_app/view/menu.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Sex { man, woman }

class Terms extends StatefulWidget {
  // final NaverAccountResult? naver;
  // const Terms({super.key, required this.naver});
  final String? kakaoAccount;
  const Terms({super.key, required this.kakaoAccount});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  Sex? _sex = Sex.man;
  String _selectedDate = '';
  final kakaoModel = KakaoModel(KakaoLogin());
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
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '약관에 동의하십니까?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // if (widget.naver != null) {
                    //   FlutterNaverLogin.logOutAndDeleteToken();
                    // }
                    if (widget.kakaoAccount != null) {
                      UserApi.instance.logout();
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
                    // if (widget.naver != null) {
                    //   _naverJoin();
                    // } else {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return const Join();
                    //       },
                    //     ),
                    //   );
                    // }
                    if (widget.kakaoAccount != null) {
                      _kakaoJoin();
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
  // _naverJoin() async {
  //   String id = widget.naver!.id;
  //   String name = widget.naver!.name;
  //   String nickname = widget.naver!.nickname;
  //   String birth = '${widget.naver!.birthyear}-${widget.naver!.birthday}';
  //   String sex = widget.naver!.gender == 'M'
  //       ? '남자'
  //       : widget.naver!.gender == 'F'
  //           ? '여자'
  //           : '기타';
  //   String email = widget.naver!.email;

  //   LoginSignUp model = LoginSignUp();
  //   model.join(id, 'naver', '', name, nickname, email, sex, birth);

  //   _naverDialog();
  // }

  // Desc: 카카오 회원가입
  // Date: 2023-03-06
  _kakaoJoin() async {
    User user = await UserApi.instance.me();
    LoginSignUp model = LoginSignUp();
    String? uId = user.kakaoAccount?.email;
    String? uName = user.kakaoAccount?.profile?.nickname;
    String? uNickname = user.kakaoAccount?.profile?.nickname;
    String? uEmail = user.kakaoAccount?.email;
    setState(() {
      _showKakaoDialog(model, uId, uName, uNickname, uEmail);
    });
  }

  Future<dynamic> _showKakaoDialog(LoginSignUp model, String? uId,
      String? uName, String? uNickname, String? uEmail) async {
    await showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (__, StateSetter setDialogState) {
              // 변수명 변경
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '생년월일',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: () => _selectDate(context),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const Text(
                    '성별',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text('남'),
                          leading: Radio<Sex>(
                            value: Sex.man,
                            groupValue: _sex,
                            onChanged: (Sex? value) {
                              setDialogState(() => _sex = value);
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('여'),
                          leading: Radio<Sex>(
                            value: Sex.woman,
                            groupValue: _sex,
                            onChanged: (Sex? value) {
                              setDialogState(() => _sex = value);
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              );
            },
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      model.join(
                          uId.toString(),
                          'Kakao',
                          '',
                          uName.toString(),
                          uNickname.toString(),
                          uEmail.toString(),
                          _sex.toString(),
                          _selectedDate);
                      _kakaoResultDialog();
                    },
                    child: const Text('입력')),
              ],
            )
          ],
        );
      },
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = selected.toString().split(' ')[0];
        print(_selectedDate);
      });
    }
  }

  _kakaoResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '카카오 회원가입을 환영합니다.',
          ),
          content: const Text(
            '카카오 회원가입이 완료되었습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                _saveId(kakaoModel.user?.kakaoAccount?.email,
                    kakaoModel.user?.kakaoAccount?.profile?.nickname);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
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
          ],
        );
      },
    );
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

  _saveId(id, name) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('uId', id);
    pref.setString('uName', name);
    Message.uName = '$name';
    print(Message.uName);
  }
}
