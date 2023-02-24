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
  late TextEditingController correctionName; //가게이름 수정

  late List correctionSectors; //업종수정
  late String selectedItem3;

  late List correctioncityList; //제주도 시 리스트
  late String selectedItem;

  late List correctionadministrationList1; //제주시 음면동
  late List correctionadministrationList2; //서귀포시 읍면동
  late String selectedItem2;
  late List corList;

  late Map correctioncity; //음면동 Map

  late TextEditingController correctionTel;
  late TextEditingController correctionAddress;

  Store store = Store();
  // final correctionSectors = ['업종1', '업종2', '업종3'];

  late int storeInt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storetitle = [];
    // storetitle = await store.storeSelect('');
    storeS();

    correctionName = TextEditingController();

    correctionSectors = ['업종1', '업종2', '업종3'];
    selectedItem3 = correctionSectors[0];

    correctioncityList = ['제주시', '서귀포시'];
    selectedItem = correctioncityList[0];

    correctionadministrationList1 = ['제주시1', '제주시2', '제주시3'];
    correctionadministrationList2 = ['서귀포시1', '서귀포시2', '서귀포시3'];

    correctioncity = {
      '제주시': correctionadministrationList1,
      '서귀포시': correctionadministrationList2,
    };

    corList = correctioncity[selectedItem];
    selectedItem2 = corList[0];

    correctionTel = TextEditingController();

    correctionAddress = TextEditingController();
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
    // print(storetitle);
    // print(storetitle.length);
    // print(storetitle[0]['sAddress']);
  }

  _cardOnTap(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('수정 / 삭제'),
          // content: const Text('가게를 등록 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                //--
                correction(context, index);
              },
              child: const Text(
                '수정',
              ),
            ),
            TextButton(
                onPressed: () {
                  //--
                  storeDelete(context, index);
                },
                child: const Text('삭제'))
          ],
        );
      },
    );
  }

  correction(BuildContext context, index) {
    storeInt = storetitle[index]['sId'];
    correctionName.text = storetitle[index]['sName'];
    setState(() {
      selectedItem3 = storetitle[index]['sCategory'];
      selectedItem = storetitle[index]['sDong'];
      // correctionTel = storetitle[index]['sTel'];
      // correctionAddress = storetitle[index]['sAddress'];
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('수정'),
          // content: const Text('가게를 등록 하시겠습니까?'),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: correctionName,
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(),
                          // hintText: '가게 이름을 입력하세요.',

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: DropdownButton(
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        underline: Container(
                          height: 1,
                          color: Colors.amber,
                        ),
                        // icon: Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Icon(Icons.arrow_drop_down_outlined),
                        // ),
                        value: selectedItem3,
                        items: correctionSectors
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedItem3 = value;
                            // value = value2;
                            // selectedItem2 = correctioncity[selectedItem][0];
                            // check1 = selectedItem;
                            // print(check1);
                            // jejeCityCkeck();
                          });
                          Navigator.pop(context);
                          correction(context, index);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: DropdownButton(
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        underline: Container(
                          height: 1,
                          color: Colors.amber,
                        ),
                        // icon: Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Icon(Icons.arrow_drop_down_outlined),
                        // ),
                        value: selectedItem,
                        items: correctioncityList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedItem = value;
                          });
                          if (value == '서귀포시') {
                            setState(() {
                              corList = correctioncity['서귀포시'];
                              selectedItem2 = corList[0];
                              // print(corList);
                            });
                          } else {
                            setState(() {
                              corList = correctioncity['제주시'];
                              selectedItem2 = corList[0];
                              // print(corList);
                            });
                          }
                          // check1 = selectedItem;
                          // print(check1);
                          // jejeCityCkeck();
                          Navigator.pop(context);
                          correction(context, index);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: DropdownButton(
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        underline: Container(
                          height: 1,
                          color: Colors.amber,
                        ),
                        value: selectedItem2,
                        items:
                            // jejuadministrationList
                            corList.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedItem2 = value;
                            // check2 = selectedItem2;
                          });
                          Navigator.pop(context);
                          correction(context, index);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: correctionTel,
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: '전화번호름 입력하세요.',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: correctionAddress,
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: '주소를 입력하세요.',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  // if (correctionName.text.trim().isEmpty) {
                  //   correctionName.text = '${storetitle[index]['sName']}';

                  //   if (selectedItem3.isEmpty) {
                  //     selectedItem3 = '${storetitle[index]['sCategory']}';

                  //     if (selectedItem2.isEmpty) {
                  //       selectedItem2 = '${storetitle[index]['sDong']}';

                  //       if (correctionTel.text.trim().isEmpty) {
                  //         correctionTel.text = '${storetitle[index]['sTel']}';

                  //         if (correctionAddress.text.trim().isEmpty) {
                  //           correctionAddress.text =
                  //               '${storetitle[index]['sAddress']}';
                  //         }
                  //       }
                  //     }
                  //   }
                  // }

                  _updateStore();
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                  // print('${storetitle[index]['sTel']}');
                  // storeS();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '수정',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        );
      },
    );
  }

  storeDelete(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제'),
          content: const Text('가게를 정말 삭제 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '아니요',
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _joinStoreDelete(index);
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  });
                  storeS();
                },
                child: const Text('예'))
          ],
        );
      },
    );
  }

  _joinStoreDelete(index) async {
    Store model = Store();
    model.storeDelete(storetitle[index]['sId']);
  }

  _updateStore() {
    Store model = Store();
    model.storeUpdate(correctionName.text.trim(), selectedItem3, selectedItem2,
        correctionTel.text.trim(), correctionAddress.text.trim(), storeInt);
  }
}
