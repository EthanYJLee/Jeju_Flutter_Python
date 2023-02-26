import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                SizedBox(
                    width: 80,
                    child: Text('이름', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '이름을 입력하세요',
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
                SizedBox(
                    width: 80,
                    child: Text('아이디', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: '이름을 입력하세요',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
