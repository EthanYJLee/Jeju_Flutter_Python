import 'package:flutter/material.dart';
import 'package:jeju_app/model/store.dart';
import 'package:jeju_app/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late List Sectors; //업종
  late String selectedItem3;

  late String storename;
  late String check1;
  late String check2;
  late String check3;

  late TextEditingController Tel;

  late TextEditingController Address;

  late String id = "";
  late String name = "";

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
    selectedItem = jejucityList[0];

    jejuadministrationList1 = [
      '건입동',
      '구좌읍',
      '남원읍',
      '노형동',
      '대륜동',
      '대정읍',
      '대천동',
      '도두동',
      '동홍동',
      '봉개동',
      '삼도이동',
      '삼도일동',
      '삼양동',
      '서홍동',
      '성산읍',
      '송산동',
      '아라동',
      '안덕면',
      '애월읍',
      '연동',
      '영천동',
      '예래동',
      '오라동',
      '외도동',
      '용담이동',
      '용담일동',
      '우도면',
      '이도이동',
      '이도일동',
      '이호동',
      '일도이동',
      '일도일동',
      '정방동',
      '조천읍',
      '중문동',
      '중앙동',
      '천지동',
      '추자면',
      '표선면',
      '한경면',
      '한림읍',
      '화북동',
      '효돈동'
    ];
    jejuadministrationList2 = [
      '건입동',
      '구좌읍',
      '남원읍',
      '노형동',
      '대륜동',
      '대정읍',
      '대천동',
      '도두동',
      '동홍동',
      '봉개동',
      '삼도이동',
      '삼도일동',
      '삼양동',
      '서홍동',
      '성산읍',
      '송산동',
      '아라동',
      '안덕면',
      '애월읍',
      '연동',
      '영천동',
      '예래동',
      '오라동',
      '외도동',
      '용담이동',
      '용담일동',
      '우도면',
      '이도이동',
      '이도일동',
      '이호동',
      '일도이동',
      '일도일동',
      '정방동',
      '조천읍',
      '중문동',
      '중앙동',
      '천지동',
      '추자면',
      '표선면',
      '한경면',
      '한림읍',
      '화북동',
      '효돈동'
    ];
    selectedItem2 = jejuadministrationList2[0];

    jejucity = {
      '제주시': jejuadministrationList1,
      '서귀포시': jejuadministrationList2,
    };

    Sectors = ['한식', '일식', '중식', '양식', '패스트푸드', '음료', '외국음식'];
    selectedItem3 = Sectors[0];

    storename = '';
    check1 = '';
    check2 = '';
    check3 = '';

    Tel = TextEditingController();

    Address = TextEditingController();

    // nameCheck = false;
    // addressCheck = false;
    // typeCheck = false;
    // telCheck = false;
    // addressCheck = false;
    _initSharedPreferences();
  }

  // Desc: Shared Preferences
  // Date: 2023-02-26
  // youngjin
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('uId'))!;
      name = (prefs.getString('uName'))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가게 추가'),
      ),
      body: Padding(
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
                        selectedItem2 = jejucity[selectedItem][0];
                        check1 = selectedItem;
                        print(check1);
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
                          check2 = selectedItem2;
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
                      value: selectedItem3,
                      items: Sectors.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedItem3 = value;
                          check3 = selectedItem3;
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
                              check1.isEmpty ||
                              check2.isEmpty ||
                              check3.isEmpty ||
                              Tel.text.trim().isEmpty ||
                              Address.text.trim().isEmpty) {
                            print('null');

                            // _shownullDialog(context);
                          } else {
                            print('not null');
                            print(Name.text);
                            print(check3);
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
    model.storeAdd(Name.text.trim(), check3, check2, Tel.text.trim(),
        Address.text.trim(), id, 'common');
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
                // Navigator.push(
                //     context, MaterialPageRoute(builder: ((context) => Home())));
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
