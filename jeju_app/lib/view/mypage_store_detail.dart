import 'package:flutter/material.dart';
import 'package:jeju_app/model/message.dart';
import 'package:jeju_app/model/store.dart';

class MyPage_Store_Detail extends StatefulWidget {
  const MyPage_Store_Detail({super.key});

  @override
  State<MyPage_Store_Detail> createState() => _MyPage_Store_DetailState();
}

class _MyPage_Store_DetailState extends State<MyPage_Store_Detail> {
  late TextEditingController correctionName;

  late List correctionSectors; //업종수정
  late String selectedItem3;

  late List correctioncityList; //제주도 시 리스트
  late String selectedItem;

  late List correctionadministrationList1; //제주시 음면동
  late List correctionadministrationList2; //서귀포시 읍면동
  late String selectedItem2;

  late Map jejucity; //음면동 Map

  late TextEditingController correctionTel;
  late TextEditingController correctionAddress;

  late int storeInt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correctionName = TextEditingController();

    correctionSectors = ['업종1', '업종2', '업종3'];
    selectedItem3 = correctionSectors[0];

    correctioncityList = ['제주시', '서귀포시'];
    selectedItem = correctioncityList[0];

    correctionadministrationList1 = ['제주시1', '제주시2', '제주시3'];
    correctionadministrationList2 = ['서귀포시1', '서귀포시2', '서귀포시3'];

    jejucity = {
      '제주시': correctionadministrationList1,
      '서귀포시': correctionadministrationList2,
    };

    selectedItem2 = correctionadministrationList1[0];

    correctionTel = TextEditingController();

    correctionAddress = TextEditingController();

    correctionName.text = Message.sName;
    setState(() {
      selectedItem3 = Message.sCategory;
      selectedItem2 = Message.sDong;
    });
    correctionTel.text = Message.sTel;
    correctionAddress.text = Message.sAddress;

    storeInt = Message.sId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('가게 수정 / 삭제'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
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
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                  width: 300,
                  //석진님
                  // child: DropdownButton<String>(
                  //   value: selectedItem,
                  //   // icon: const Icon(Icons.arrow_drop_down_outlined),
                  //   // elevation: 16,
                  //   style: const TextStyle(color: Colors.orange),
                  //   // underline: const SizedBox.shrink(),
                  //   onChanged: (String? value) {
                  //     // This is called when the user selects an item.
                  //     setState(() {
                  //       selectedItem = value!;
                  //     });
                  //   },
                  //   items: jejucityList.map<DropdownMenuItem<String>>((value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
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
                        selectedItem2 = jejucity[selectedItem][0];
                        // check1 = selectedItem;
                        // print(check1);
                        // jejeCityCkeck();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 300,
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
                      value: selectedItem2,
                      items:
                          // jejuadministrationList
                          jejucity[selectedItem]
                              .map<DropdownMenuItem<String>>((value) {
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
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
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
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _cardOnTap(context);
                    },
                    child: const Text('수정하기')),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      storeDelete(context);
                    },
                    child: const Text('삭제하기'))
              ],
            )
          ],
        ),
      ),
    );
  }

  _cardOnTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('수정하기'),
          content: const Text('수정이 완료 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                //--
                _updateStore();
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }

  _updateStore() {
    Store model = Store();
    model.storeUpdate(correctionName.text.trim(), selectedItem3, selectedItem2,
        correctionTel.text.trim(), correctionAddress.text.trim(), storeInt);
  }

  storeDelete(BuildContext context) {
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
                    _joinStoreDelete();
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  });
                },
                child: const Text('예'))
          ],
        );
      },
    );
  }

  _joinStoreDelete() async {
    Store model = Store();
    model.storeDelete(storeInt);
  }
}
