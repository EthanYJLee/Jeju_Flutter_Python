import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewMap extends StatefulWidget {
  const ViewMap({super.key});

  @override
  State<ViewMap> createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('지도'),
      ),
      body: Center(
        child: Column(
          children: [Text('map')],
        ),
      ),
    );
  }
}
