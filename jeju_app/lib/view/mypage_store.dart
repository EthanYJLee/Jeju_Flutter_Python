import 'package:flutter/material.dart';
import 'package:jeju_app/model/message.dart';
import 'package:jeju_app/model/store.dart';

import 'package:jeju_app/view/mypage_store_add.dart';
import 'package:jeju_app/view/mypage_store_detail.dart';

class MyPage_Store extends StatefulWidget {
  const MyPage_Store({super.key});

  @override
  State<MyPage_Store> createState() => _MyPage_StoreState();
}

class _MyPage_StoreState extends State<MyPage_Store> {
  late List storetitle;

  late List corList;

  Store store = Store();

  late int storeInt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storetitle = [];
    storeS();

    storeInt = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 가게'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage_Store_Add(),
                  ),
                ).then((value) => storeS());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: storetitle.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onLongPress: () {
            onTap: () {
              // _cardOnTap(context, index);
              Message.sName = storetitle[index]['sName'];
              Message.sCategory = storetitle[index]['sCategory'];
              Message.sDong = storetitle[index]['sDong'];
              Message.sTel = storetitle[index]['sTel'];
              Message.sAddress = storetitle[index]['sAddress'];
              Message.sId = storetitle[index]['sId'];
              print(Message.sId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyPage_Store_Detail(),
                ),
              ).then((value) => storeS());
            },
            child: Card(
              // color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('${storetitle[index]['sName']}',
                          style: TextStyle(fontSize: 23)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('업종 : ${storetitle[index]['sCategory']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('행정동 : ${storetitle[index]['sDong']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('전화번호 : ${storetitle[index]['sTel']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('주소 : ${storetitle[index]['sAddress']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //Functions
  storeS() async {
    List listTest = [];
    listTest = await store.storeSelect('test');
    setState(() {
      storetitle = listTest;
    });
    print(storetitle);
    print(storetitle.length);
    print(storetitle[0]['sId']);
  }
}
