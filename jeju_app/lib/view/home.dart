import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:intl/intl.dart';
import 'package:jeju_app/model/news_model.dart';
import 'package:jeju_app/model/store.dart';
import 'package:jeju_app/util/card_dialog.dart';
import 'package:jeju_app/util/popup_card.dart';
import 'package:jeju_app/util/popup_news.dart';
import 'package:jeju_app/view/mypage_store_add.dart';
import 'package:jeju_app/view/predict.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
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
  List<NewsModel> news = [];
  bool isLoading = true;
  Future initNews() async {
    news = await getNews();
  }

  // Desc: Shared Preferences 받기
  // Date: 2023-02-22
  // youngjin
  late String id = "";
  late String name = "";

  late List stores = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();

    initNews().then((_) {
      setState(() {
        isLoading = false;
        _getMyStore();
      });
    });
  }

  // Desc: 내 매장 정보 가져오기
  // Date: 2023-02-26
  // youngjin
  _getMyStore() async {
    Store _store = Store();
    stores = await _store.storeSelect(id);
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
      id = (prefs.getString('uId'))!;
      name = (prefs.getString('uName'))!;
    });
  }

  // Desc: 관광 관련 News 보여주는 ListView
  // Date: 2023-02-22
  // youngjin
  Widget _viewNews() {
    return Container(
      height: 300,
      width: 350,
      child: Column(
        children: [
          isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()],
                )
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          width: 160,
                          padding: const EdgeInsets.all(2),
                          child: Card(
                            elevation: 2,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(CardDialog(builder: (context) {
                                  return PopupNews(
                                      title: news[index].title,
                                      description: news[index].description,
                                      originallink: news[index].originallink);
                                }));
                              },
                              child: Column(
                                children: [
                                  Text(
                                    news[index].title,
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    maxLines: 4,
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

  // Desc: 내 매장 목록 보여주는 리스트뷰
  // Date: 2023-02-21
  // youngjin
  Widget _storeList() {
    // 카드 묶는 컨테이너
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
                                builder: ((context) =>
                                    const MyPage_Store_Add())));
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
                          Text('매장 등록하기'),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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

  // --------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '$name님의 매장',
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            _viewNews(),
            const SizedBox(
              height: 10,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: ((context) => const AddStore())));
            //     },
            //     child: const Text('매장추가(임시)'))
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------

// ----------------------Functions----------------------
Future<List<NewsModel>> getNews() async {
  List<NewsModel> _newslist = [];
  NewsModel _newsModel;
  Map<String, String> header = {
    'X-Naver-Client-Id': 'f6wde9wfHSqXYORRMmgN',
    'X-Naver-Client-Secret': 'n_K6rgD9dR'
  };

  var query = '제주도 관광';
  var url = Uri.parse(
      'https://openapi.naver.com/v1/search/news.json?query=${query}&display=10&start=1');
  var res = await http.get(url, headers: header);
  var news = json.decode(utf8.decode(res.bodyBytes));
  if (res.statusCode == 200) {
    for (var i in news['items']) {
      String title = parseHtmlString(i['title']);
      String description = parseHtmlString(i['description']);
      String originallink = parseHtmlString(i['originallink']);
      _newsModel = NewsModel(
          title: title, description: description, originallink: originallink);
      _newslist.add(_newsModel);
    }
  }
  return _newslist;
}

String parseHtmlString(String htmlString) {
  try {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  } catch (e) {
    return htmlString;
  }
}
