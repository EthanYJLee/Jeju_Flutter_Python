import 'package:flutter/material.dart';
import 'package:jeju_app/model/store.dart';

class MyPage_Profile extends StatefulWidget {
  const MyPage_Profile({super.key});

  @override
  State<MyPage_Profile> createState() => _MyPage_ProfileState();
}

class _MyPage_ProfileState extends State<MyPage_Profile> {
  late TextEditingController userName;
  late TextEditingController userId;
  late TextEditingController userPw1;
  late TextEditingController userPw2;
  late TextEditingController userEmail;
  late TextEditingController userNick;
  late String userBrith;
  late String userSex;

  Store store = Store();
  late List storetitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName = TextEditingController();
    userBrith = 'null';
    userSex = '남자';

    storetitle = [];
    storeS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계정 관리'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('이름', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          readOnly: true,
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '이름 확인',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('아이디', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          readOnly: true,
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '아이디 확인',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('비밀번호', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '비밀번호를 입력하세요.',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('비밀번호 확인', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '비밀번호를 다시 입력하세요.',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('이메일', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '이메일을 입력하세요.',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('닉네일', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 200,
                      child: TextField(
                          controller: userName,
                          decoration: const InputDecoration(
                            hintText: '닉네일을 입력하세요.',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 176, 162, 39)),
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('생년원일', style: TextStyle(fontSize: 18))),
                    SizedBox(
                      width: 120,
                      child: Text(userBrith == 'null' ? '선택하세요' : userBrith,
                          style: const TextStyle(fontSize: 16)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showDate();
                      },
                      child: const Text(
                        '입력하기',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 110,
                        child: Text('성별', style: TextStyle(fontSize: 18))),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 0,
                        right: 40,
                        bottom: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: '남자',
                            groupValue: userSex,
                            onChanged: (value) {
                              userSex = value!;
                            },
                          ),
                          const Text('남자'),
                          const SizedBox(
                            width: 10,
                          ),
                          Radio(
                            value: '여자',
                            groupValue: userSex,
                            onChanged: (value) {
                              userSex = value!;
                            },
                          ),
                          const Text('여자'),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                    // Radio(
                    //   value: '남자',
                    //   groupValue: userSex,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       userSex = value!;
                    //     });
                    //   },
                    // ),
                    // const Text(
                    //   '남자',
                    // ),
                    // Radio(
                    //   value: '여자',
                    //   groupValue: userSex,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       userSex = value!;
                    //     });
                    //   },
                    // ),
                    // const Text(
                    //   '여자',
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 0, right: 0, bottom: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            //--
                          },
                          child: const Text('저장하기')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//function
  _showDate() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime(1980), //초기값
      firstDate: DateTime(1900), //시작일
      lastDate: DateTime.now(), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    selectedDate.then(
      (value) {
        setState(() {
          userBrith = value.toString().split(' ')[0];
        });
      },
    );
  }

  //Functions
  storeS() async {
    List listTest = [];
    listTest = await store.userSelect('test');
    setState(() {
      storetitle = listTest;
    });
    // print(storetitle);
    // print(storetitle.length);
    // print(storetitle[0]['sAddress']);
  }
}//end
