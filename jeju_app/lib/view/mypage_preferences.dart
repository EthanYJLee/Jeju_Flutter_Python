import 'package:flutter/material.dart';
import 'package:jeju_app/view/mypage_preferences_profile.dart';


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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 7, left: 9, right: 9, bottom: 10),
                    child: Text(
                      '사용자 설정',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyPage_Profile(),
                          ),
                        );
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
                    padding:
                        EdgeInsets.only(top: 10, left: 9, right: 9, bottom: 10),
                    child: Text(
                      '기타',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           //--
              //         },
              //         child: const Text('공지사항',
              //             style: TextStyle(fontSize: 18, color: Colors.black))),
              //   ],
              // ),
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
      ),
    );
  }
}
