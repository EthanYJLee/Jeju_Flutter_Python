import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jeju_app/util/card_dialog.dart';
import 'package:jeju_app/view/predict.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      color: Color.fromARGB(100, 154, 155, 151),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(CardDialog(builder: (context) {
                            return _PopupCard(sName: '1');
                          }));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------

// Desc: 카드 (매장 tap 했을 때 수정/매출 예측할 수 있는 Dialog 출력)
// Date: 2023-02-21
// youngjin
const String sName = '';

class _PopupCard extends StatelessWidget {
  const _PopupCard({Key? key, required this.sName}) : super(key: key);

  final String sName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: sName,
          createRectTween: (begin, end) {
            return RectTween(begin: begin, end: end);
          },
          child: Material(
            color: Color.fromARGB(255, 245, 239, 221),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('매장명'),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Text('설명'),
                    const Divider(
                      color: Colors.white,
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
                                    builder: ((context) => const Predict())));
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
    );
  }
}
