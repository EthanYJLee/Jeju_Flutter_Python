import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jeju_app/model/store_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordProfit extends StatefulWidget {
  const RecordProfit({super.key});

  @override
  State<RecordProfit> createState() => _RecordProfitState();
}

class _RecordProfitState extends State<RecordProfit> {
  late String uId = "";
  late String uName = "";
  late String uIdType = "";
  late String profitDate = "";

  late String selectedItem = "";

  // Desc: 내 매장 리스트 확인
  // Date: 2023-03-11
  // youngjin
  late List stores = [];
  late List<String> sNameList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences().then((_) {
      setState(() {
        _getMyStore();
      });
    });
  }

  // Desc: 내 매장 정보 가져오기
  // Date: 2023-03-11
  // youngjin
  _getMyStore() async {
    StoreModel _store = StoreModel();
    stores = await _store.storeSelect(uId);
    for (int i = 0; i < stores.length; i++) {
      sNameList.add(stores[i]['sName']);
    }
    setState(() {
      print(stores);
      print(stores.first['sName']);
      print(sNameList);
      selectedItem = stores.first['sName'];
    });
  }

  // Desc: Shared Preferences
  // Date: 2023-03-11
  // youngjin
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uId = (prefs.getString('uId'))!;
      uName = (prefs.getString('uName'))!;
      uIdType = (prefs.getString('uIdType'))!;
      profitDate = (prefs.getString('profitDate'))!;
      print(uIdType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('매출 입력'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stores.isEmpty
                  // ? CircularProgressIndicator()
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('매출 발생일자'), Text(profitDate)],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('매장 선택'),
                              DropdownButton<String>(
                                // itemHeight: 50,
                                menuMaxHeight: 150,
                                value: selectedItem,
                                onChanged: (String? value) {
                                  setState(() => selectedItem = value!);
                                },
                                items: sNameList.map((String item) {
                                  return DropdownMenuItem<String>(
                                    child: Text('$item'),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('매출액'),
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: () {}, child: Text('입력'))
            ],
          ),
        ),
      ),
    );
  }
}
