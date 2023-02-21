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

  final TextEditingController dongController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> dongEntries =
        <DropdownMenuEntry<String>>[];
    for (final dong in dongList) {
      dongEntries.add(DropdownMenuEntry<String>(value: dong, label: dong));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 정보 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SingleChoice(),
            FilledButton.tonal(
              onPressed: () {},
              child: Text('예측'),
            )
          ],
        ),
      ),
    );
  }
}

enum Categories { a, b, c, d, e, f, g }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Categories category = Categories.a;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Categories>(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).primaryColorLight),
      ),
      showSelectedIcon: false,
      segments: const <ButtonSegment<Categories>>[
        ButtonSegment<Categories>(
          value: Categories.a,
          label: Text(
            '한식',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.b,
          label: Text(
            '일식',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.c,
          label: Text(
            '중식',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.d,
          label: Text(
            '양식',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.e,
          label: Text(
            '패스트\n푸드',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.f,
          label: Text(
            '음료',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ButtonSegment<Categories>(
          value: Categories.g,
          label: Text(
            '외국음식',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
      selected: <Categories>{category},
      onSelectionChanged: (Set<Categories> newCategory) {
        setState(() {
          category = newCategory.first;
        });
      },
    );
  }
}
