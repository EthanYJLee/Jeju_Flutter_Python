import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeju_app/model/record_message.dart';

class ModifySalesRecord extends StatefulWidget {
  const ModifySalesRecord({super.key});

  @override
  State<ModifySalesRecord> createState() => _ModifySalesRecordState();
}

class _ModifySalesRecordState extends State<ModifySalesRecord> {
  late TextEditingController sCategory;
  late TextEditingController mMemo;
  late TextEditingController mDate;
  late TextEditingController mProfit;

  late List businessCategory; //직종 콤보박스 데이터베이스 연경해야함(테스트 중식/일식)
  late String businessCategoryItem; //위에서 택해진 것

  late String textCategory;
  late String textMonth;

  late List<String> year1;
  late String yearItem;
  late List<String> month1;
  late String monthItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sCategory = TextEditingController();
    mMemo = TextEditingController();
    mDate = TextEditingController();
    mProfit = TextEditingController();

    businessCategory = ["빵 및 과자류 소매업", "일식 음식점업"];
    businessCategoryItem = businessCategory[0];

    year1 = Message.year1;
    month1 = Message.month1;

    yearItem = year1[0];
    monthItem = month1[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드 지우기
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 20,
              left: 5,
              right: 5,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("년도 :  "),
                    ),
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: DropdownButton<String>(
                        value: yearItem,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.orange),
                        underline: const SizedBox.shrink(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            yearItem = value!;
                            mDate.text = "$yearItem년 $monthItem월";
                          });
                        },
                        items: year1.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("월 :  "),
                    ),
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: DropdownButton<String>(
                        value: monthItem,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.orange),
                        underline: const SizedBox.shrink(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            monthItem = value!;
                            mDate.text = "$yearItem년 $monthItem월";
                          });
                        },
                        items: month1.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text("업종 선택 :  "),
                  ),
                  //-----------------------------------업종 선택 콤보박스 시작
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: DropdownButton<String>(
                        value: businessCategoryItem,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.orange),
                        underline: const SizedBox.shrink(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            businessCategoryItem = value!;
                            sCategory.text = businessCategoryItem;
                          });
                        },
                        items: businessCategory
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  //-----------------------------------업종 선택 콤보박스 끝
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: TextField(
                  controller: mDate,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    hintText: '입력날짜 (월)',
                  ),
                  readOnly: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                child: Text(
                  "* 날짜(월)는 위의 선택사항에서 선택해주세요.",
                  style: TextStyle(fontSize: 11, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: TextField(
                  controller: sCategory,
                  readOnly: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    hintText: '업종입력',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 167, 0),
                child: Text(
                  "* 업종은 위의 선택사항에서 선택해주세요.",
                  style: TextStyle(fontSize: 11, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: TextField(
                    controller: mMemo,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      hintText: '메모입력',
                      suffixIcon: IconButton(
                        onPressed: () {
                          //textEditingController1지우기
                          mMemo.text = "";
                        },
                        icon: const Icon(Icons.cancel),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                child: Text(
                  "* 메모는 필수입력사항이 아닙니다.",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: TextField(
                  controller: mProfit,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    hintText: '매출입력',
                    suffixIcon: IconButton(
                      onPressed: () {
                        //textEditingController1지우기
                        mProfit.text = "";
                      },
                      icon: const Icon(Icons.cancel),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (int.parse(yearItem + monthItem) <=
                            int.parse(Message.strYear.toString() +
                                Message.strMonth) &&
                        mDate.text.trim().isNotEmpty &&
                        sCategory.text.trim().isNotEmpty &&
                        mProfit.text.trim().isNotEmpty) {
                      Navigator.of(context).pop();
                    } else if (int.parse(yearItem + monthItem) >
                        int.parse(
                            Message.strYear.toString() + Message.strMonth)) {
                      monthCheck(context);
                    } else if (mDate.text.trim().isEmpty) {
                      //
                      nullCheck1(context);
                    } else if (sCategory.text.trim().isEmpty) {
                      nullCheck2(context);
                    } else if (mProfit.text.trim().isEmpty) {
                      nullCheck3(context);
                    }
                  },
                  icon: const Icon(
                    Icons.receipt,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    '수정하기',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(400, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  nullCheck1(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '                                  입력날짜를 입력해주세요.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.orange,
      ),
    );
  }

  nullCheck2(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '                                  업종을 입력해주세요.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.orange,
      ),
    );
  }

  nullCheck3(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '                                  매출을 입력해주세요.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.orange,
      ),
    );
  }

  monthCheck(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '                       선택하신 월은 선택이 불가능합니다.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
