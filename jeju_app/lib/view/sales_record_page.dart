import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jeju_app/model/record_message.dart';
import 'package:jeju_app/model/record_model.dart';
import 'package:jeju_app/view/modify_sales_record.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class SalesRecordPage extends StatefulWidget {
  const SalesRecordPage({super.key});

  @override
  State<SalesRecordPage> createState() => _SalesRecordPageState();
}

class _SalesRecordPageState extends State<SalesRecordPage> {
  late TextEditingController salesRecord; //액수 입력

  late List businessCategory; //직종 콤보박스 데이터베이스 연경해야함(테스트 중식/일식)
  late String businessCategoryItem; //위에서 택해진 것

  late List<SalesData> chartData; //입력된 월과 금액 데이터베이스 연경해야함

  late int strYear; //현재 년도
  late String strMonth; //현재 월

  late List data; //리스트뷰 데이터 리스트

  late List<String> year1;
  late String yearItem;
  late List<String> month1;
  late String monthItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    strYear = 0;
    getYear();
    strMonth = "";
    getMonth();

    salesRecord = TextEditingController();

    businessCategory = ["빵 및 과자류 소매업", "일식 음식점업"];
    businessCategoryItem = businessCategory[0];

    chartData = [
      SalesData("2023-1", 3500000),
      SalesData("2023-2", 4000000),
      SalesData("2023-3", 3000000),
      SalesData("2023-4", 5000000),
      SalesData("2023-5", 3300000),
      SalesData("2023-6", 7000000)
    ];

    data = [];

    year1 = [];
    addYear();
    yearItem = year1[0].toString();

    month1 = [
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      "10",
      "11",
      "12"
    ];
    monthItem = "01";

    Message.year1 = year1;
    Message.month1 = month1;
    Message.strYear = strYear;
    Message.strMonth = strMonth;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드 지우기
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        //스크롤 주기
        body: SingleChildScrollView(
          child: Padding(
            //오토레이아웃
            padding: EdgeInsets.only(
                top: 20,
                left: 5,
                right: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
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
                                });
                              },
                              items:
                                  year1.map<DropdownMenuItem<String>>((value) {
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
                                });
                              },
                              items:
                                  month1.map<DropdownMenuItem<String>>((value) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //-----------------------------------텍스트 필드 시작
                        SizedBox(
                          height: 100,
                          width: 330,
                          child: TextField(
                            cursorColor: Colors.orange,
                            controller: salesRecord,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can
                            decoration: InputDecoration(
                              labelText: "   우리 가게 매출",
                              labelStyle: const TextStyle(color: Colors.grey),
                              // ignore: unnecessary_brace_in_string_interps
                              hintText:
                                  " $businessCategoryItem의 $monthItem월 매출",
                              hintStyle: const TextStyle(color: Colors.grey),
                              // hintStyle: TextStyle(color: Colors.orange),
                              enabledBorder: const OutlineInputBorder(
                                //선택전 라인 스타일
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)), //라운딩
                                borderSide: BorderSide(
                                  color: Colors.orange, //색상
                                  width: 3, //두께
                                ),
                              ),

                              //선택후 스타일
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange, width: 3.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              //x아이콘 전부 지우기
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //textEditingController1지우기
                                  salesRecord.text = "";
                                },
                                icon: const Icon(Icons.cancel),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        //-----------------------------------텍스트 필드 끝
                        //-----------------------------------입력버튼 시작
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 39),
                          child: ElevatedButton(
                            onPressed: () {
                              //입력 코드

                              if (int.parse(yearItem + monthItem) <=
                                      int.parse(
                                          strYear.toString() + strMonth) &&
                                  salesRecord.text.trim().isNotEmpty) {
                                getYear();
                                insertCheck(context);
                              } else if (int.parse(yearItem + monthItem) >
                                  int.parse(strYear.toString() + strMonth)) {
                                monthCheck(context);
                              } else {
                                //
                                nullCheck(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(50, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),

                                //20이끝 - 없음
                              ),
                            ),
                            child: const Text(
                              "입력",
                            ),
                          ),
                        ),
                        //-----------------------------------입력버튼 끝
                      ],
                    ),
                    //-----------------------------------그래프 시작

                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 300, 0),
                          child: Text(
                            "단위 (원)",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                          child: SizedBox(
                            width: 350,
                            height: 300,
                            child: SfCartesianChart(
                              // Applies currency format for y axis labels and also for data labels
                              primaryYAxis: NumericAxis(),
                              primaryXAxis: CategoryAxis(),
                              // title: ChartTitle(text: '6개월간 가게매출 변화'),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries>[
                                // Renders line chart
                                LineSeries<SalesData, String>(
                                  color: Colors.orange,
                                  dataSource: chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.month,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales_rec,
                                  // dataLabelSettings:
                                  //     const DataLabelSettings(isVisible: true),
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //-----------------------------------그래프 끝
                    //-----------------------------------리스트 뷰 시작
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        data.isEmpty
                            ? const Text('데이터가 없습니다')
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.blue,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const ModifySalesRecord();
                                            },
                                          ),
                                        ).then((value) => getJsonData());
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '업종분류 : ${data[index]['sCategory']}'),
                                                      ],
                                                    ),
                                                    //메모는 길어질수도 있으니까 잘라주기
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                  child:
                                                                      RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            16.0),
                                                                text: TextSpan(
                                                                  text:
                                                                      '메모 : ${data[index]['mMemo']}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    height: 1.4,
                                                                    fontFamily:
                                                                        'NanumSquareRegular',
                                                                  ),
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '입력년도 : ${data[index]['mDate']}'),
                                                      ],
                                                    ),
                                                    //가격은 길어질수도 있으니까 잘라주기
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                  child:
                                                                      RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            16.0),
                                                                text: TextSpan(
                                                                  text:
                                                                      '입력금액 : ${data[index]['mProfit']}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    height: 1.4,
                                                                    fontFamily:
                                                                        'NanumSquareRegular',
                                                                  ),
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 200,
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      '입력(월)',
                                                    ),
                                                    Text(
                                                        '${data[index]['mMonth']}월'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 220, 0),
                          child: Text(
                            "* 추가/수정은 기록을 클릭해주세요. ",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    //-----------------------------------리스트 뷰 끝
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  insertCheck(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "'$businessCategoryItem의 $monthItem월' \n매출을 추가하시겠습니까?",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              height: 110,
              child: Column(
                children: [
                  Text(
                      "선택년도 : $yearItem \n업종선택 : $businessCategoryItem \n입력금액 : ${salesRecord.text} 원"),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "* 메모는 추가/수정페이지에서 가능합니다.",
                      style: TextStyle(fontSize: 11, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  salesRecord.clear();

                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                child: const Text(
                  '입력',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //test연결
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ModifySalesRecord();
                      },
                    ),
                  ).then((value) =>
                      getJsonData()); //=========================================================================테스트
                  salesRecord.clear();
                },
                //of는 작은 화면들>>>pop끄겠다.

                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                child: const Text(
                  '취소',
                ),
              ),
            ],
          );
        });
  }

  nullCheck(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '                              매출금액을 입력해주세요.',
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

  int getYear() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy');
    strYear = int.parse(formatter.format(now));
    return strYear;
  }

  String getMonth() {
    setState(() {
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('MM');
      strMonth = formatter.format(now);
    });
    return strMonth;
  }

  //sql문 쓸곳 수정 필요
  Future<bool> getJsonData() async {
    var url = Uri.parse(
        'http://192.168.45.252:8080/Flutter/student_query_flutter.jsp'); //local host=127.0.0.1 안드로이드
    var response = await http.get(url);
    data.clear();
    //중복 방지
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson["results"];

    setState(() {
      data.addAll(result);
    });
    //print(respnse.body);

    return true;
    //bool return 안해도 됨 다른걸로 해도됨
  }

  addYear() {
    setState(() {
      for (int i = 0; i <= 50; i++) {
        year1.add((strYear - i).toString());
      }
    });
  }
}
