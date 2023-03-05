import 'package:flutter/material.dart';
import 'package:jeju_app/model/store_model.dart';
import 'package:jeju_app/view/home.dart';
import 'package:jeju_app/view/mypage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage_Store_Add extends StatefulWidget {
  const MyPage_Store_Add({super.key});

  @override
  State<MyPage_Store_Add> createState() => _MyPage_Store_AddState();
}

class _MyPage_Store_AddState extends State<MyPage_Store_Add> {
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
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user_uid = (prefs.getString('uId'))!;
      user_uIdType = (prefs.getString('uIdType'))!;
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
  late String dong = dongList[0];
  late String category = categoryList[0];

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
              initialSelection: dongList[0],
              controller: sDongController,
              label: const Text('행정동'),
              dropdownMenuEntries: dongEntries,
              // inputDecorationTheme: const InputDecorationTheme(filled: true),
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
              initialSelection: categoryList[0],
              controller: sCategoryController,
              label: const Text('카테고리'),
              dropdownMenuEntries: categoryEntries,
              // inputDecorationTheme: const InputDecorationTheme(filled: true),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 추가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 10),
              child: TextField(
                controller: sNameController,
                decoration: const InputDecoration(hintText: '매장명 입력'),
              ),
            ),
            _dropdownArea(),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextField(
                controller: sTelController,
                decoration: const InputDecoration(hintText: '전화번호 입력'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 100),
              child: TextField(
                controller: sAddressController,
                decoration: const InputDecoration(hintText: '주소 입력'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showDialog(context);
                  });
                },
                child: const Text('추가하기'))
          ],
        ),
      ),
    );
  }

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
                },
                child: const Text('등록'))
          ],
        );
      },
    );
  } //

  // -----------Functions---------------

  _joinStore() async {
    StoreModel model = StoreModel();
    model.storeAdd(
        sNameController.text.trim(),
        sCategoryController.text,
        sDongController.text,
        sTelController.text.trim(),
        sAddressController.text.trim(),
        user_uid,
        'common');
    setState(() {
      _joinDialog();
    });
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
                Navigator.of(context).popUntil((route) => route.isFirst);
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
}
