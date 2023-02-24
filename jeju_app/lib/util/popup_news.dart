// Desc: 뉴스 클릭했을 때 Dialog 출력
// Date: 2023-02-21
// youngjin
import 'package:flutter/material.dart';
import 'package:jeju_app/view/predict.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PopupNews extends StatelessWidget {
  const PopupNews(
      {Key? key,
      required this.title,
      required this.description,
      required this.originallink})
      : super(key: key);

  final String title;
  final String description;
  final String originallink;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Hero(
              tag: title,
              createRectTween: (begin, end) {
                return RectTween(begin: begin, end: end);
              },
              child: Material(
                color: const Color.fromARGB(255, 245, 239, 221),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 30,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          description,
                          maxLines: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            launchUrlString(originallink);
                          },
                          child: const Text(
                            '기사 보기',
                            style: TextStyle(
                              color: Color.fromARGB(229, 225, 127, 7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(219, 245, 168, 74),
                            ),
                            child: const Text('닫기')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
