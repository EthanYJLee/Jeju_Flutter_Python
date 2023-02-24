import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:jeju_app/util/shared.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late TextEditingController monthController;
  late TextEditingController dongController;
  late TextEditingController categoryController;

  String result = '';

  late String month = '';
  late String dong = '';
  late String category = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthController = TextEditingController();
    dongController = TextEditingController();
    categoryController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('예측'),
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: monthController,
                decoration: const InputDecoration(
                  labelText: '월',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: dongController,
                decoration: const InputDecoration(
                  labelText: '행정동',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: '업종',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                month = monthController.text;
                dong = dongController.text;
                category = categoryController.text;
                getJSONData();
              },
              child: const Text(
                '예측하기',
              ),
            ),
          ],
        )),
      ),
    );
  }

  // ----- Functions -----
  getJSONData() async {
    // String ip = Shared.ipAddress;
    print(utf8.encode(month));
    var data_month = utf8.encode(month);
    var data_dong = utf8.encode(dong);
    var data_category = utf8.encode(category);

    print(data_month);
    var decoded_month = '';
    for (var i = 0; i < data_month.length; i++) {
      decoded_month += '%' + data_month[i].toRadixString(16);
    }
    print(decoded_month);

    var url = Uri.parse(
        'http://localhost:5002/jeju?month=$decoded_month&dong=$dong&category=$category');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      _showDialog(context, result);
    });
    // var _month = utf8.encode(month);
    // var _dong = utf8.encode(dong);
    // var _category = utf8.encode(category);

    // var decodedMonth = '';
    // for (var i = 0; i < _month.length; i++) {
    //   decodedMonth += '%' + _month[i].toRadixString(16);
    // }
    // var decodedDong = '';
    // for (var i = 0; i < _dong.length; i++) {
    //   decodedDong += '%' + _dong[i].toRadixString(16);
    // }

    // var decodedCategory = '';
    // for (var i = 0; i < _category.length; i++) {
    //   decodedCategory += '%' + _category[i].toRadixString(16);
    // }

    // var url = Uri.parse(
    //     'http://localhost:5000/jeju?month=$decodedMonth&dong=$decodedDong&category=$decodedCategory');
    // var response = await http.get(url);
    // print(response.body);
    // print(response.bodyBytes);
    // if (response.bodyBytes.isNotEmpty) {
    //   setState(() {
    //     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    //     result = dataConvertedJSON['result'];
    //     _showDialog(context, result);
    //   });
    // } else {
    //   print(utf8.encode(month));
    //   print(utf8.encode(dong));
    //   print(utf8.encode(category));
    // }
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
        context: context,
        builder: ((BuildContext context) {
          return AlertDialog(
            title: const Text('예측 결과'),
            content: Text('결과는 $result 입니다.'),
          );
        }));
  }
}
