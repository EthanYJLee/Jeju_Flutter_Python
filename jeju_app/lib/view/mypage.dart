import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  "userId 님 환영합니다.",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text("환경설정",
                        style: TextStyle(fontSize: 20, color: Colors.black)))
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      //     Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  (),
                      //   ),
                      // );
                    },
                    child: const Text('매출 입력하기'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
