import 'package:flutter/material.dart';

class SearchId extends StatefulWidget {
  const SearchId({super.key});

  @override
  State<SearchId> createState() => _SearchIdState();
}

class _SearchIdState extends State<SearchId> {

  late TextEditingController uName ;
  late TextEditingController uPhone ;

  @override
  void initState() {
    super.initState();
    uName = TextEditingController();
    uPhone = TextEditingController();
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
            const Text("아이디찾기 ",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.green,
                fontSize: 40,
              ),
            ),
            Container(height: 50,),
            TextField(
              controller: uName,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "이름을 입력해주세요",
                prefixIcon: const Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Container(height: 20),
            TextField(
              controller: uPhone,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "전화번호를 입력해주세요",
                prefixIcon: const Icon(Icons.phone_android),
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
            child: const Text("ID 찾기"),),
            ),
          ],
        ),
      ),
    );
  }

}