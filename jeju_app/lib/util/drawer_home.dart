import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
          child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('header')],
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            '매장 관리',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.grey[850],
          ),
          title: const Text('사용자 설정'),
          onTap: () {
            print('Home is clicked');
          },
        ),
      ],
    );
  }
}
