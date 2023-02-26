import 'package:flutter/material.dart';
import 'package:jeju_app/model/search.dart';
import 'package:jeju_app/view/login.dart';
import 'package:jeju_app/view/search_pw.dart';

class SearchId extends StatefulWidget {
  const SearchId({super.key});

  @override
  State<SearchId> createState() => _SearchIdState();
}

class _SearchIdState extends State<SearchId> {
  TextEditingController unameController = TextEditingController();
  TextEditingController uemailController = TextEditingController();
  // late bool booluname;
  // late bool booluemail;

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
            
              const Text("아이디찾기",
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
                      onPressed: () async {
                        if(unameController.text.trim().isNotEmpty && uemailController.text.trim().isNotEmpty){
                           _searchid();
                           Navigator.of(context).pop;
                        }else{
                          nullCheck(context);
                           Navigator.of(context).pop;
                        }                     
                    },
                    child: const Text("ID 찾기"),),
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPw())),
                    child: const Text('Password 찾기'),),
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
    _searchid() async {
    SearchIdPw model = SearchIdPw();
    String check =
        await model.searchid(unameController.text.trim(), uemailController.text.trim());

    if (check != "") {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: Text('당신의 Id는 $check 입니다.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('확인')
                  ),
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