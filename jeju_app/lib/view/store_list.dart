import 'package:flutter/material.dart';
import 'package:jeju_app/model/message.dart';
import 'package:jeju_app/model/store_model.dart';
import 'package:jeju_app/view/store_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  late List stores;

  StoreModel storeModel = StoreModel();

  late String uId = "";
  late String uName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stores = [];

    _initSharedPreferences();
  }

  // Desc: Shared Preferences
  // Date: 2023-02-26
  // youngjin
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uId = (prefs.getString('uId'))!;
      uName = (prefs.getString('uName'))!;
      _storeListView();
    });
  }

  // Desc: 매장 리스트 불러오기
  // Date: 2023-02-27
  // youngjin
  _storeListView() async {
    List _storelist = [];
    _storelist = await storeModel.storeSelect(uId);
    setState(() {
      stores = _storelist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 목록'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Message.sId = stores[index]['sId'];
                  Message.sName = stores[index]['sName'];
                  Message.sCategory = stores[index]['sCategory'];
                  Message.sDong = stores[index]['sDong'];
                  Message.sTel = stores[index]['sTel'];
                  Message.sAddress = stores[index]['sAddress'];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreDetail(),
                    ),
                  ).then((value) => _storeListView());
                },
                child: Card(
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('매장명: ${stores[index]['sName']}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('업종: ${stores[index]['sCategory']}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('행정동 : ${stores[index]['sDong']}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('전화번호 : ${stores[index]['sTel']}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('주소 : ${stores[index]['sAddress']}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
