import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  TextEditingController idCont = TextEditingController();
  late bool correctId;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correctId = false;
    correctPw = false;
    correctName = false;
    correctNickName = false;
    correctEmail = false;
    pwcheck = false;
    sex = '남자';
    birth = '1900-01-01';
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
                      decoration: const InputDecoration(
                        labelText: 'ID를 입력하세요',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: pwCont,
                      decoration: const InputDecoration(
                        labelText: '비밀번호를 입력하세요',
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: pwcheckCont,
                      decoration: const InputDecoration(
                        labelText: '비밀번호를 다시 한 번 입력하세요',
                      ),
                      obscureText: true,
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
                      ),
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
                      ),
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
                        ),
                        keyboardType: TextInputType.emailAddress),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //--
                  },
                  child: const Text(
                    '회원가입',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
