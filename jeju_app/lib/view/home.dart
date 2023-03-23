import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:jeju_app/kakao_login.dart';
import 'package:jeju_app/model/news_model.dart';
import 'package:jeju_app/model/store_model.dart';
import 'package:jeju_app/util/card_dialog.dart';
import 'package:jeju_app/util/drawer_home.dart';
import 'package:jeju_app/util/popup_card.dart';
import 'package:jeju_app/util/popup_news.dart';
import 'package:jeju_app/view/login.dart';
import 'package:jeju_app/view/edit_profile.dart';
import 'package:jeju_app/view/select_date.dart';
import 'package:jeju_app/view/store_list.dart';
import 'package:jeju_app/view/news_main.dart';
import 'package:jeju_app/view/predict.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:jeju_app/view/store_add.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<NewsModel> news = [];
  // bool isLoading = true;
  // Future initNews() async {
  //   news = await getNews();
  // }

  // Desc: Shared Preferences 받기
  // Date: 2023-02-22
  // youngjin
  late String uId = "";
  late String uName = "";
  late String uIdType = "";

  // Desc: 내 매장 리스트 확인
  // Date: 2023-03-07
  // youngjin
  late List stores = [];

  // Drawer
  final DrawerHome drawerHome = const DrawerHome();

  KakaoLogin kakaoLogin = KakaoLogin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kakaoLogin.checkToken();
    _initSharedPreferences().then((_) {
      setState(() {
        _getMyStore();
      });
    });

    // initNews().then((_) {
    //   setState(() {
    //     isLoading = false;
    //     _getMyStore();
    //   });
    // });
  }

  // Desc: 내 매장 정보 가져오기
  // Date: 2023-02-26
  // youngjin
  _getMyStore() async {
    StoreModel _store = StoreModel();
    stores = await _store.storeSelect(uId);
    setState(() {
      print(stores);
    });
  }

  // Desc: Shared Preferences
  // Date: 2023-02-23
  // youngjin
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uId = (prefs.getString('uId'))!;
      uName = (prefs.getString('uName'))!;
      uIdType = (prefs.getString('uIdType'))!;
      print(uIdType);
    });
  }

  Widget _news() {
    return Container(
        height: 110,
        width: 350,
        decoration: BoxDecoration(
          // border: Border.all(
          //   style: BorderStyle.solid,
          //   width: 1,
          // ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const NewsMain())));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.newspaper,
                  color: Colors.amberAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '제주 관광 뉴스',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ));
  }

  // Desc: 내 매장 목록 보여주는 리스트뷰
  // Date: 2023-02-21
  // youngjin
  Widget _storeList() {
    // 카드 묶는 컨테이너
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   style: BorderStyle.solid,
        //   width: 1,
        // ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      // ----------------------- 내 매장 리스트뷰 -----------------------
      // 이 부분에서 매장 있는지 체크한 후 '내 매장' / '매장 등록하기'
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: (stores.isEmpty)
                ? Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const StoreAdd())));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_location_alt,
                            color: Colors.amberAccent,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '매장 등록하기',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          elevation: 2,
                          child: InkWell(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                prefs.setString(
                                    'sName', stores[index]['sName']);
                                prefs.setString(
                                    'sDong', stores[index]['sDong']);
                                prefs.setString(
                                    'sCategory', stores[index]['sCategory']);
                              });
                              Navigator.of(context)
                                  .push(CardDialog(builder: (context) {
                                return PopupCard(
                                    sName: stores[index]['sName'],
                                    sTel: stores[index]['sTel'],
                                    sAddress: stores[index]['sAddress'],
                                    sDong: stores[index]['sDong'],
                                    sCategory: stores[index]['sCategory']);
                              }));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  stores[index]['sName'],
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }

  // Desc: 매장관리 Grid View
  // Date: 2023-03-10
  // youngjin
  Widget _gridCard(dynamic icon, String title, dynamic path) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => path)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Desc: Drawer
  // Date: 2023-03-11
  // youngjin
  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Text(
              '사용자 설정',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ListTile(
              title: const Text('회원정보 수정', style: TextStyle(fontSize: 14)),
              dense: true,
              visualDensity: const VisualDensity(vertical: -2),
              onTap: () {
                print('회원정보 수정');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const EditProfile())));
              },
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Text(
              '기타',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: const Text('로그아웃', style: TextStyle(fontSize: 14)),
                  onTap: () {
                    _logOut(context);
                  },
                ),
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: const Text('회원탈퇴', style: TextStyle(fontSize: 14)),
                  onTap: () {
                    _deleteAccount(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------build-----------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Semantics(
            label: 'add profit',
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SelectDate())));
              },
              heroTag: 'note',
              tooltip: 'Add Profit Info',
              child: const Icon(Icons.note_add),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      drawer: _drawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$uName님의 매장',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                width: 350,
                child: _storeList(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      '오늘의 이슈',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                width: 350,
                child: _news(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      '매장 관리',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    children: [
                      _gridCard(Icons.store, '조회', const StoreList()),
                      _gridCard(Icons.add, '추가', const StoreAdd()),
                      _gridCard(Icons.note, '기록', const StoreList()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _logOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('로그아웃'),
          content: const Text('로그아웃 하시겠습니까?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      _disposeSharedPreferences();
                      // 로그인 화면 라우터 설정
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          settings: const RouteSettings(name: "/login"),
                          builder: (context) => const Login(),
                        ),
                      );
                      // 로그인 화면으로 이동
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName("/login"));
                    },
                    child: const Text('네')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.pop(context);
                    },
                    child: const Text('아니오')),
              ],
            )
          ],
        );
      },
    );
  } // _logout

  _deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '회원탈퇴',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('회원가입시 입력했던 개인정보는\n보관기간 (5년) 종료 시 즉각 삭제됩니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  _disposeSharedPreferences();
                  // 로그인 화면 라우터 설정
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: const RouteSettings(name: "/login"),
                      builder: (context) => const Login(),
                    ),
                  );
                  // 로그인 화면으로 이동
                  Navigator.of(context).popUntil(ModalRoute.withName("/login"));
                },
                child: const Text(
                  '계정 정보 삭제',
                  style: TextStyle(color: Colors.red),
                ))
          ],
        );
      },
    );
  } // _deleteAccount

  // Desc: Shared Preferences 초기화
  // Date: 2023-02-22
  static _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
