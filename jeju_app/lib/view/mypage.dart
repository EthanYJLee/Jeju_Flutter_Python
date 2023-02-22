import 'package:flutter/material.dart';
import 'package:jeju_app/view/mypage_preferences.dart';

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
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "userId 님 환영합니다.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyPage_Preferences(),
                          ),
                        );
                      },
                      child: const Text("환경설정",
                          style: TextStyle(fontSize: 20, color: Colors.black))),
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
      ),
    );
  }
}
