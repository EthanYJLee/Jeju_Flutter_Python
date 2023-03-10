import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jeju_app/view/home.dart';
import 'package:jeju_app/view/view_map.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        // children: const [Home(), ViewMap(), MyPage()],
        children: const [Home(), ViewMap()],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.orange,
        child: TabBar(controller: controller, labelColor: Colors.white, tabs: [
          Tab(
            child: Icon(
              Icons.home,
            ),
          ),
          Tab(
            child: Icon(
              Icons.pin_drop_outlined,
            ),
          ),
          // Tab(
          //   child: Icon(
          //     Icons.person,
          //   ),
          // ),
        ]),
      ),
    );
  }
}
