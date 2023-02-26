import 'package:flutter/material.dart';
import 'package:jeju_app/view/add_store.dart';
import 'package:jeju_app/view/mypage_store_add.dart';

class MyPage_Store extends StatefulWidget {
  const MyPage_Store({super.key});

  @override
  State<MyPage_Store> createState() => _MyPage_StoreState();
}

class _MyPage_StoreState extends State<MyPage_Store> {
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
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AddStore())));
                },
                child: const Text('매장추가'))
          ],
        ),
      ),
    );
  }
}
