import 'package:flutter/material.dart';
import 'package:jeju_app/model/search.dart';
import 'package:jeju_app/model/search_model.dart';
import 'package:jeju_app/view/login.dart';
import 'package:jeju_app/view/update_pw.dart';

class SearchPw extends StatefulWidget {
  const SearchPw({super.key});

  @override
  State<SearchPw> createState() => _SearchPwState();
}

class _SearchPwState extends State<SearchPw> {

 TextEditingController unameController = TextEditingController();
 TextEditingController uidController = TextEditingController();
 TextEditingController uemailController = TextEditingController();
 late bool booluname;
 late bool booluid;
 late bool booluemail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset : false,
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
              const Text("비밀번호찾기",
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.green,
                  fontSize: 40,
                ),
              ),
              Container(height: 50,),
              TextField(
                controller: unameController,
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
                controller: uidController,
                decoration: InputDecoration(
                  labelText: "ID",
                  hintText: "아이디를 입력해주세요",
                  prefixIcon: const Icon(Icons.assignment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Container(height: 20),
              TextField(
                controller: uemailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "이메일을 입력해주세요",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Container(height: 60,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: SizedBox(
                      height:50,
                      width:150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        side: const BorderSide(width: 3, color: Colors.amberAccent),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onPressed: () {
                        if(unameController.text.trim().isNotEmpty && uidController.text.trim().isNotEmpty && uemailController.toString().trim().isNotEmpty) {
                          _searchpw();
                          Navigator.of(context).pop;
                        }else if(unameController.text.trim().isEmpty || uidController.text.trim().isEmpty || uemailController.text.trim().isEmpty){
                          nullCheck(context);
                          Navigator.of(context).pop;
                        }
                      },
                    child: const Text("PW 찾기"),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: SizedBox(
                      height:50,
                      width:150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        side: const BorderSide(width: 3, color: Colors.amberAccent),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));                      
                    },
                    child: const Text('Login 페이지로 가기'),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    // Functions
  // 비밀번호 찾기(2023-02-22)
    _searchpw() async {
    SearchIdPw model = SearchIdPw();

    String check2 =
        await model.searchpw(unameController.text.trim(), uidController.text.trim(), uemailController.text.trim());

    if (check2 != "") {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: Text('당신의 비밀번호는 $check2입니다.\n비밀번호를 바꾸시겠습니까?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Message.idController = uidController.text.trim();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePw()));
                  },
                  child: const Text('비밀번호 변경하기')),
                  TextButton(onPressed: () => Navigator.pop(context, '취소'), child: const Text('취소')),
              ],
            );
            
          },
      );
    }
  }

  nullCheck(BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('항목들을 전부 입력해주세요.'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
     ));
  }
}