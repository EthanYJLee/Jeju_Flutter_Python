import 'package:flutter/material.dart';
import 'package:jeju_app/model/login_signup.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  TextEditingController idCont = TextEditingController();
  late bool correctId;
  late bool idCheck;
  TextEditingController pwCont = TextEditingController();
  late bool correctPw;
  TextEditingController pwcheckCont = TextEditingController();
  late bool pwcheck;
  TextEditingController nameCont = TextEditingController();
  late bool correctName;
  TextEditingController nicknameCont = TextEditingController();
  late bool correctNickName;
  TextEditingController emailCont = TextEditingController();
  late bool correctEmail;
  late String sex;
  late String birth;
  RegExp pwReg = RegExp(r"^[0-9a-z]{8,16}$");
  RegExp emailReg =
      RegExp(r"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  RegExp idReg = RegExp(r"^[0-9a-z]{5,20}$");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correctId = false;
    idCheck = false;
    correctPw = false;
    correctName = false;
    correctNickName = false;
    correctEmail = false;
    pwcheck = false;
    sex = '남자';
    birth = 'null';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '회원가입',
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: idCont,
                      decoration: InputDecoration(
                        labelText: idCont.text.trim().isEmpty
                            ? 'ID를 입력하세요.'
                            : !correctId
                                ? '사용 불가능한 ID입니다.'
                                : !idCheck
                                    ? '중복된 ID입니다.'
                                    : '사용 가능한 ID입니다.',
                        hintText: '영문 소문자와 숫자를 포함하여 5~20자리',
                        icon: const Icon(Icons.account_circle),
                      ),
                      onChanged: (value) async {
                        bool check = await _idCheck();
                        if (idReg.hasMatch(value.trim())) {
                          if (!check) {
                            setState(() {
                              idCheck = true;
                            });
                          } else {
                            setState(() {
                              idCheck = false;
                            });
                          }
                          correctId = true;
                        } else {
                          setState(() {
                            correctId = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: pwCont,
                      decoration: InputDecoration(
                        labelText: pwCont.text.trim().isEmpty
                            ? '비밀번호를 입력하세요'
                            : correctPw
                                ? '사용 가능한 비밀번호입니다.'
                                : '사용 불가능한 비밀번호입니다.',
                        hintText: '영문 소문자와 숫자를 포함하여 8~16자리',
                        icon: const Icon(Icons.lock),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        if (pwReg.hasMatch(value.trim())) {
                          setState(() {
                            correctPw = true;
                          });
                          if (value.trim() == pwcheckCont.text.trim()) {
                            setState(() {
                              pwcheck = true;
                            });
                          } else {
                            setState(() {
                              pwcheck = false;
                            });
                          }
                        } else {
                          setState(() {
                            correctPw = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: pwcheckCont,
                      decoration: InputDecoration(
                        labelText: pwcheckCont.text.trim().isEmpty
                            ? '비밀번호를 다시 한 번 입력하세요'
                            : pwcheck
                                ? '비밀번호가 일치합니다.'
                                : '비밀번호가 일치하지 않습니다.',
                        hintText: '영문 소문자와 숫자를 모두 포함하여 8~16자리',
                        icon: const Icon(Icons.check),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        if (value.trim() == pwCont.text) {
                          setState(() {
                            pwcheck = true;
                          });
                        } else {
                          setState(() {
                            pwcheck = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: nameCont,
                      decoration: const InputDecoration(
                        labelText: '이름을 입력하세요',
                        icon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        if (value.trim().isNotEmpty) {
                          setState(() {
                            correctName = true;
                          });
                        } else {
                          setState(() {
                            correctName = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: nicknameCont,
                      decoration: const InputDecoration(
                        labelText: '닉네임을 입력하세요',
                        icon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        if (value.trim().length >= 2 &&
                            value.trim().length <= 10) {
                          setState(() {
                            correctNickName = true;
                          });
                        } else {
                          setState(() {
                            correctNickName = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailCont,
                      decoration: const InputDecoration(
                        labelText: '이메일을 입력하세요',
                        icon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (emailReg.hasMatch(value)) {
                          setState(() {
                            correctEmail = true;
                          });
                        } else {
                          setState(() {
                            correctEmail = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '성별',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: '남자',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),
                    const Text(
                      '남자',
                    ),
                    Radio(
                      value: '여자',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),
                    const Text(
                      '여자',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '생년월일',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      birth == 'null' ? '생년월일을 입력하세요' : birth,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showDate();
                      },
                      child: const Text(
                        '입력하기',
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
                      },
                      child: const Text(
                        '취소',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: correctId &
                              idCheck &
                              correctPw &
                              pwcheck &
                              correctName &
                              correctNickName &
                              correctEmail &
                              (birth != 'null')
                          ? () {
                              _joinConfirm();
                            }
                          : null,
                      child: const Text(
                        '회원가입',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Functions

  //Desc: 회원가입
  //Date: 2023-02-21
  _join() async {
    LoginSignUp model = LoginSignUp();
    model.join(
        idCont.text.trim(),
        'common',
        pwCont.text.trim(),
        nameCont.text.trim(),
        nicknameCont.text.trim(),
        emailCont.text.trim(),
        sex,
        birth);
  }

  //Desc: 생년월일 다이얼로그
  //Date: 2023-02-21
  _showDate() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime(1980), //초기값
      firstDate: DateTime(1900), //시작일
      lastDate: DateTime.now(), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    selectedDate.then(
      (value) {
        setState(() {
          birth = value.toString().split(' ')[0];
        });
      },
    );
  }

  //Desc: ID 중복체크
  //Date: 2023-02-22
  Future<bool> _idCheck() async {
    LoginSignUp model = LoginSignUp();

    return await model.idCheck(idCont.text.trim());
  }

  //Desc: 회원가입 확인 다이얼로그
  //Date: 2023-02-22
  _joinConfirm() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '회원가입',
          ),
          content: const Text(
            '회원가입을 하시겠습니까?',
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
                _join();
                Navigator.of(context).pop();
                _joinDialog();
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

  //Desc: 회원가입 다이얼로그
  //Date: 2023-02-22
  _joinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '환영합니다!',
          ),
          content: const Text(
            '회원가입이 완료되었습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
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
