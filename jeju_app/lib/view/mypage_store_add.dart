import 'package:flutter/material.dart';

class MyPage_Store_Add extends StatefulWidget {
  const MyPage_Store_Add({super.key});

  @override
  State<MyPage_Store_Add> createState() => _MyPage_Store_AddState();
}

class _MyPage_Store_AddState extends State<MyPage_Store_Add> {
  late TextEditingController Name; //가게 이름

  late List jejucityList; //제주도 시 리스트
  late String selectedItem;

  late List jejuadministrationList1; //제주시 음면동
  late List jejuadministrationList2; //서귀포시 읍면동
  late String selectedItem2;

  late Map jejucity; //음면동 Map

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name = TextEditingController();

    jejucityList = ['제주시', '서귀포시'];
    selectedItem = jejucityList[0];

    jejuadministrationList1 = ['한림읍', '애월읍', '구좌읍', '조천읍'];
    jejuadministrationList2 = ['제주시', '서귀포시', '몰라', '몰루'];
    selectedItem2 = jejuadministrationList1[0];

    jejucity = {
      '제주시': jejuadministrationList1,
      '서귀포시': jejuadministrationList2,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가게 추가'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text(
                //   '가게 이름',
                //   style: TextStyle(fontSize: 18),
                // ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: Name,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: '가게명을 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.amber),
                      // ),
                    ),
                  ),
                )
              ],
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
                    items: jejucityList.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedItem = value;

                        // jejeCityCkeck();
                      });
                    },
                  ),
                ),
              ],
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
                        });
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  //function
  // jejeCityCkeck() {
  //   selectedItem == '제주시'
  //       ? jejuadministrationList = jejuadministrationList1[0]
  //       : selectedItem == "서귀포시"
  //           ? jejuadministrationList = jejuadministrationList2[0]
  //           : jejuadministrationList = jejuadministrationList0[0];

  //   if (selectedItem == '제주시') {
  //     selectedItem2 = jejuadministrationList1[0];
  //     jejuadministrationList = jejuadministrationList0;
  //   } else if (selectedItem == '서귀포시') {
  //     selectedItem2 = jejuadministrationList2[0];
  //     jejuadministrationList = jejuadministrationList2;
  //   } else {
  //     selectedItem2 = jejuadministrationList0[0];
  //     jejuadministrationList = jejuadministrationList0;
  //   }
  // }
}//end
