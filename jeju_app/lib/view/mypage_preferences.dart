import 'package:flutter/material.dart';

class MyPage_Preferences extends StatefulWidget {
  const MyPage_Preferences({super.key});

  @override
  State<MyPage_Preferences> createState() => _MyPage_PreferencesState();
}

class _MyPage_PreferencesState extends State<MyPage_Preferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences Test'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    '사용자 설정',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text('계정 / 정보 관리',
                        style: TextStyle(fontSize: 18, color: Colors.black))),
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.black38,
              thickness: 0.5,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    '기타',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text('공지사항',
                        style: TextStyle(fontSize: 18, color: Colors.black))),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text('로그아웃',
                        style: TextStyle(fontSize: 18, color: Colors.black))),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text('탈퇴하기',
                        style: TextStyle(fontSize: 18, color: Colors.black))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
