import 'package:flutter/material.dart';

class MyPage_Profile extends StatefulWidget {
  const MyPage_Profile({super.key});

  @override
  State<MyPage_Profile> createState() => _MyPage_ProfileState();
}

class _MyPage_ProfileState extends State<MyPage_Profile> {
  late TextEditingController userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계정 관리'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('이름', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '이름 확인',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('아이디', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '아이디 확인',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('비밀번호', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '비밀번호를 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('비밀번호 확인', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '비밀번호를 다시 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('이름', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '이름을 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('이메일', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '이메일을 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('닉네일', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '닉네일을 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('생일', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '생일을 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 110,
                    child: Text('성별', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '성별을 입력하세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            ),
            // Row(
            //   children: [
            //     ElevatedButton(
            //       onPressed: onPressed,
            //       child: Text(data)
            //       )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
