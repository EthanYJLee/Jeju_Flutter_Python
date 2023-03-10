import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jeju_app/view/record_profit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  // 달력에서 선택한 날짜
  late DateTime selectedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '날짜 선택',
        ),
        actions: [
          IconButton(
            onPressed: () {
              _saveSelectedDate();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const RecordProfit()),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        // automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2000, 1, 1),
              lastDate: DateTime(2023, 12, 31),
              onDateChanged: ((value) {
                setState(() {
                  selectedDate = value;
                });
              }),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                _saveSelectedDate();
              },
              child: const Text(
                '전체 매출기록 조회',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----
  // Desc: 선택한 날짜 Shared Preferences에 String으로 save하고 넘겨주기
  // 2022.12.25
  _saveSelectedDate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profitDate', selectedDate.toString().substring(0, 10));
  }
}
