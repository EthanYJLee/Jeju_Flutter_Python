import 'package:flutter/material.dart';
import 'package:jeju_app/model/store_model.dart';
import 'package:jeju_app/view/mypage_my_profile.dart';
import 'package:jeju_app/view/mypage_store_add.dart';
import 'package:jeju_app/view/mypage_store_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late String uId = "";
  late String uName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uId = (prefs.getString('uId'))!;
      uName = (prefs.getString('uName'))!;
    });
  }

  Widget _gridCard(dynamic icon, String title, dynamic path) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => path)));
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        // title: const Text('My Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage_MyProfile(),
                  ),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '매장 관리',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(48, 161, 149, 149),
                      width: 2,
                    ),
                  ),
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    children: [
                      _gridCard(Icons.store, '나의 매장', const MyPage_StoreList()),
                      _gridCard(Icons.add, '매장 추가', const MyPage_Store_Add()),
                      _gridCard(Icons.note, '매장 기록', const MyPage_StoreList()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
