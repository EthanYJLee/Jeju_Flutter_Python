import 'package:flutter/material.dart';
import 'package:jeju_app/model/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage_Store_Add extends StatefulWidget {
  const MyPage_Store_Add({super.key});

  @override
  State<MyPage_Store_Add> createState() => _MyPage_Store_AddState();
}

class _MyPage_Store_AddState extends State<MyPage_Store_Add> {
  late TextEditingController Name; //가게 이름

  late List jejucityList; //제주도 시 리스트
  late String storeCity;

  late List jejuadministrationList1; //제주시 음면동
  late List jejuadministrationList2; //서귀포시 읍면동
  late String storeEmd;

  late Map jejucity; //음면동 Map

  late List Sectors; //업종
  late String storeCategory;

  late String storename;
  // late String storeCity;
  // late String storeEmd;
  // late String check3;

  late TextEditingController Tel;

  late TextEditingController Address;

  // late bool nameCheck;
  // late bool administrationCheck;
  // late bool typeCheck;
  // late bool telCheck;
  // late bool addressCheck;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name = TextEditingController();

    jejucityList = ['제주시', '서귀포시'];
    storeCity = jejucityList[0];

    jejuadministrationList1 = ['제주시1', '제주시2', '제주시3'];
    jejuadministrationList2 = ['서귀포시1', '서귀포시2', '서귀포시3'];
    storeEmd = jejuadministrationList1[0];

    jejucity = {
      '제주시': jejuadministrationList1,
      '서귀포시': jejuadministrationList2,
    };

    Sectors = ['업종1', '업종2', '업종3'];
    storeCategory = Sectors[0];

    storename = '';
    // check1 = '';
    // check2 = '';
    // check3 = '';

    Tel = TextEditingController();

    Address = TextEditingController();

    // nameCheck = false;
    // addressCheck = false;
    // typeCheck = false;
    // telCheck = false;
    // addressCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가게 추가'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 40,
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
              const SizedBox(
                height: 20,
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
                      value: storeCity,
                      items: jejucityList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          storeCity = value;
                          storeEmd = jejucity[storeCity][0];
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
                        value: storeEmd,
                        items:
                            // jejuadministrationList
                            jejucity[storeCity]
                                .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            storeEmd = value;
                          });
                        },
                      ))
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
                        value: storeCategory,
                        items: Sectors.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            storeCategory = value;
                            // check3 = selectedItem3;
                          });
                        },
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: Tel,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: '전화번호를 입력하세요.',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.amber),
                    // ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: Address,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: '주소를 입력하세요.',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.amber),
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 0, right: 0, bottom: 20),
                    child: SizedBox(
                      width: 120,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            if (Name.text.trim().isEmpty ||
                                // check3.isEmpty ||
                                Tel.text.trim().isEmpty ||
                                Address.text.trim().isEmpty) {
                              print('null');
      
                              // _shownullDialog(context);
                            } else {
                              print('not null');
                              print(Name.text);
                              // print(check3);
                              // getDementiaData();
      
                              _showDialog(context);
                            }
                          },
                          child:
                              const Text('추가하기', style: TextStyle(fontSize: 18))),
                    ),
                  )
                ],
              )
            ],
          ),
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

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력결과'),
          content: const Text('가게를 등록 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
              ),
            ),
            TextButton(
                onPressed: () {
                  _joinStore();
                  Navigator.of(context).pop();
                  // Navigator.pop(context);
                  _joinDialog();
                },
                child: const Text('등록'))
          ],
        );
      },
    );
  } //

  _joinStore() async {
    Store model = Store();
    final pref = await SharedPreferences.getInstance();
    String? userid = pref.getString('uId');
    String? utype = pref.getString('uIdType');
    model.storeAdd(Name.text.trim(), storeCategory, storeEmd, Tel.text.trim(),
        Address.text.trim(), userid!, utype!);
  }

  _joinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '축하합니다.',
          ),
          content: const Text(
            '가게 등록이 완료되었습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
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
}//end
