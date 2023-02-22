// Desc: 카드 (매장) tap 했을 때 수정/매출 예측할 수 있는 Dialog 출력
// Date: 2023-02-21
// youngjin
import 'package:flutter/material.dart';
import 'package:jeju_app/view/predict.dart';

const String sName = '';

class PopupCard extends StatelessWidget {
  const PopupCard({Key? key, required this.sName}) : super(key: key);

  final String sName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Hero(
              tag: sName,
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
                        const Text('매장명'),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        const Text('주소'),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        const Text('전화번호'),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('정보수정'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Predict())));
                              },
                              child: const Text('매출예측'),
                            ),
                          ],
                        ),
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
