import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/message.dart';

class StoreDetail extends StatefulWidget {
  const StoreDetail({super.key});

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  late String dong = dongList[0];
  late String category = categoryList[0];
  // 매장정보 입력받는 Controller
  late TextEditingController sNameController = TextEditingController();
  late TextEditingController sCategoryController = TextEditingController();
  late TextEditingController sDongController = TextEditingController();
  late TextEditingController sTelController = TextEditingController();
  late TextEditingController sAddressController = TextEditingController();
  late String user_uid = "";
  late String user_uIdType = "";

  // tf 입력받은 결과값
  late String sName;
  late String sCategory;
  late String sDong;
  late String sTel;
  late String sAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
    sNameController.text = Message.sName;
    sTelController.text = Message.sTel;
    sAddressController.text = Message.sAddress;
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user_uid = (prefs.getString('uId'))!;
      // user_uIdType = (prefs.getString('uIdType'))!;
    });
  }

  // 행정동 리스트
  late List<String> dongList = [
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

  // 카테고리 리스트
  late List<String> categoryList = [
    '한식',
    '일식',
    '중식',
    '양식',
    '패스트푸드',
    '음료',
    '외국음식'
  ];

  Widget _dropdownArea() {
    // 행정동 dropdown list
    final List<DropdownMenuEntry<String>> dongEntries =
        <DropdownMenuEntry<String>>[];
    for (final dong in dongList) {
      dongEntries.add(DropdownMenuEntry<String>(value: dong, label: dong));
    }

    // 업종 dropdown list
    final List<DropdownMenuEntry<String>> categoryEntries =
        <DropdownMenuEntry<String>>[];
    for (final category in categoryList) {
      categoryEntries
          .add(DropdownMenuEntry<String>(value: category, label: category));
    }
    return Container(
      height: 100,
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownMenu(
              menuHeight: 200,
              width: 150,
              initialSelection: Message.sDong,
              controller: sDongController,
              // 초기값 설정
              label: const Text('행정동'),
              dropdownMenuEntries: dongEntries,
              onSelected: (value) {
                dong = sDongController.text;
              },
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: DropdownMenu(
              menuHeight: 200,
              width: 150,
              // 초기값 설정
              initialSelection: Message.sCategory,
              controller: sCategoryController,
              label: const Text('카테고리'),
              dropdownMenuEntries: categoryEntries,
              onSelected: (value) {
                category = sCategoryController.text;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('매장정보'),
        ),
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 0, bottom: 10),
                    child: TextField(
                      controller: sNameController,
                      readOnly: true,
                      decoration: const InputDecoration(helperText: '매장명'),
                    ),
                  ),
                  _dropdownArea(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: TextField(
                      controller: sTelController,
                      decoration: const InputDecoration(helperText: '전화번호'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: TextField(
                      controller: sAddressController,
                      decoration: const InputDecoration(helperText: '주소'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // _showDialog(context);
                            });
                          },
                          child: const Text(
                            '수정',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // _showDialog(context);
                            });
                          },
                          child: const Text(
                            '삭제',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
