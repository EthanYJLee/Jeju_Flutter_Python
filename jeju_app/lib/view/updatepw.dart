import 'package:flutter/material.dart';

class UpdatePw extends StatefulWidget {
  const UpdatePw({super.key});

  @override
  State<UpdatePw> createState() => _UpdatePwState();
}

class _UpdatePwState extends State<UpdatePw> {

  late TextEditingController uPw ;
  late TextEditingController uPw2;

  @override
  void initState() {
    super.initState();
    uPw = TextEditingController();
    uPw2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(20),
        padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("새로운 비밀번호를 입력해주세요",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.green,
                fontSize: 30,
              ),
            ),
            Container(height: 50,),
            TextField(
              controller: uPw,
              decoration: InputDecoration(
                hintText: "비밀번호를 입력해주세요",
                prefixIcon: const Icon(Icons.key),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Container(height: 20,),
            TextField(
              controller: uPw2,
              decoration: InputDecoration(
                hintText: "비밀번호를 다시 한 번 입력해주세요",
                prefixIcon: const Icon(Icons.check),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Container(height: 60,),
            SizedBox(
              height:50,
              width:200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
                side: BorderSide(width: 3, color: Colors.amberAccent),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              onPressed: () {
              //
            },
            child: const Text("비밀번호 변경하기"),),
            ),
          ],
        ),
      ),
    );
  }
}