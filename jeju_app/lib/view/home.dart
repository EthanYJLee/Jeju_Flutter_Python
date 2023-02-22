import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:jeju_app/model/news_model.dart';
import 'package:jeju_app/util/card_dialog.dart';
import 'package:jeju_app/util/popup_card.dart';
import 'package:jeju_app/util/popup_news.dart';
import 'package:jeju_app/view/predict.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initNews().then((_) {
      setState(() {
        isLoading = false;
      });
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
          Expanded(
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
                      color: Color.fromARGB(219, 245, 168, 74),
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
                                  fontSize: 17, color: Colors.white),
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

  // Desc: 내 매장 리스트
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
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      // 내 매장 리스트뷰
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      elevation: 2,
                      color: Color.fromARGB(219, 245, 168, 74),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(CardDialog(builder: (context) {
                            return const PopupCard(sName: '1');
                          }));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '매장명',
                              style: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '주소',
                              style: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
      backgroundColor: Color.fromARGB(100, 154, 155, 151),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '매장을 선택해주세요',
              ),
            ),
            Container(
              height: 110,
              width: 350,
              child: _storeList(),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '오늘의 이슈',
              ),
            ),
            _viewNews()
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------

// ----------------------Class----------------------

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
