import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('header')],
        )),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.grey[850],
          ),
          title: Text('사용자 설정'),
          onTap: () {
            print('Home is clicked');
          },
        ),
      ],
    );
  }
}
