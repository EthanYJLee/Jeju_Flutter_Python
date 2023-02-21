import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  late List<String> dongList = [
    '일도일동',
    '일도이동',
    '이도일동',
    '이도이동',
    '삼도일동',
    '삼도이동',
    '용담일동',
    '용담이동',
    '건입동',
    '화북동',
    '삼양동',
    '봉개동',
    '아라동',
    '오라동',
    '연동',
    '노형동',
    '외도동',
    '이호동',
    '도두동'
  ];
  late List<String> categoryList = [
    '한식',
    '일식',
    '중식',
    '양식',
    '패스트푸드',
    '음료',
    '외국음식'
  ];
  final TextEditingController dongController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 정보 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: InfoChoice(),
            ),
            SizedBox(
              height: 60,
              child: Expanded(
                child: DropdownMenu(
                  menuHeight: 200,
                  width: 200,
                  initialSelection: dongList[0],
                  controller: dongController,
                  label: const Text('행정동'),
                  dropdownMenuEntries: dongEntries,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: Expanded(
                child: DropdownMenu(
                  menuHeight: 200,
                  width: 200,
                  initialSelection: categoryList[0],
                  controller: categoryController,
                  label: const Text('카테고리'),
                  dropdownMenuEntries: categoryEntries,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('예측'),
            )
          ],
        ),
      ),
    );
  }
}

// Desc: 내 정보 가져오기 / 직접 입력 선택하는 Segmented Button
// Date: 2023-02-21
// youngjin
enum WhichInfo { myStore, byMyself }

class InfoChoice extends StatefulWidget {
  const InfoChoice({super.key});

  @override
  State<InfoChoice> createState() => _InfoChoiceState();
}

class _InfoChoiceState extends State<InfoChoice> {
  WhichInfo choice = WhichInfo.myStore;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<WhichInfo>(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
        Color.fromARGB(46, 154, 155, 151),
      )),
      segments: const <ButtonSegment<WhichInfo>>[
        ButtonSegment<WhichInfo>(
            value: WhichInfo.myStore,
            label: Text(
              '내 정보 가져오기',
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.bold),
            ),
            icon: Icon(Icons.store)),
        ButtonSegment<WhichInfo>(
            value: WhichInfo.byMyself,
            label: Text(
              '직접 입력하기',
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.bold),
            ),
            icon: Icon(Icons.note_add_outlined)),
      ],
      selected: <WhichInfo>{choice},
      onSelectionChanged: (Set<WhichInfo> newChoice) {
        setState(() {
          choice = newChoice.first;
        });
      },
    );
  }
}
