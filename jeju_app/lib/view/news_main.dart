import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:html/parser.dart';
import 'package:jeju_app/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:jeju_app/util/card_dialog.dart';
import 'package:jeju_app/util/popup_news.dart';

class NewsMain extends StatefulWidget {
  const NewsMain({super.key});

  @override
  State<NewsMain> createState() => _NewsMainState();
}

class _NewsMainState extends State<NewsMain> {
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
    return isLoading
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color.fromARGB(48, 161, 149, 149),
                        width: 2,
                      ),
                    ),
                    height: 70,
                    width: 160,
                    child: Card(
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
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 이슈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ListView.builder(itemBuilder: itemBuilder)
            _viewNews(),
          ],
        ),
      ),
    );
  }
}

// ----------------------Functions----------------------
Future<List<NewsModel>> getNews() async {
  List<NewsModel> _newslist = [];
  NewsModel _newsModel;
  Map<String, String> header = {
    'X-Naver-Client-Id': 'f6wde9wfHSqXYORRMmgN',
    'X-Naver-Client-Secret': 'n_K6rgD9dR'
  };

  // Desc: 기사 불러오기
  // '제주도 관광'이라는 키워드로 검색한 뉴스 결과 20개 가져오기
  // Date: 2023-03-06
  // youngjin
  var query = '제주도 관광';
  var url = Uri.parse(
      'https://openapi.naver.com/v1/search/news.json?query=${query}&display=20&start=1');
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
