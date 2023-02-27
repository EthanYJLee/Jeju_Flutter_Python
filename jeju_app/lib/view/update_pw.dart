
import 'package:flutter/material.dart';
import 'package:jeju_app/model/search.dart';
import 'package:jeju_app/model/search_model.dart';
import 'package:jeju_app/view/login.dart';

class UpdatePw extends StatefulWidget {
  const UpdatePw({super.key});

  @override
  State<UpdatePw> createState() => _UpdatePwState();
}

class _UpdatePwState extends State<UpdatePw> {

  TextEditingController uPasswordController = TextEditingController();
  TextEditingController uPassword2Controller = TextEditingController();
  late bool booluPassword;
  late bool booluPassword2;

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
     child: Scaffold(
      resizeToAvoidBottomInset : false,
        body: Container(
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
                controller: uPasswordController,
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
                controller: uPassword2Controller,
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
                  backgroundColor: Colors.amberAccent,
                  side: BorderSide(width: 3, color: Colors.amberAccent),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                onPressed: () async {
                if(uPasswordController.text == uPassword2Controller.text && uPasswordController.text.trim().isNotEmpty) {
                  _updatepw();
                  Navigator.of(context).pop;
                }else if(uPasswordController.text != uPassword2Controller.text){
                  MySnackBar(context);
                  Navigator.of(context).pop;
                  
                }else if(uPasswordController.text.trim().isEmpty && uPassword2Controller.text.trim().isEmpty) {
                    nullCheck(context);
                    Navigator.of(context).pop;
                }
              },
              child: const Text("비밀번호 변경하기"),),
              ),
            ],
          ),
        ),
      ),
   );
  }
 // 비밀번호 변경하기
_updatepw() async {
  SearchIdPw model = SearchIdPw();

  bool check3 = 
    await model.updatepw(uPasswordController.text.trim(), Message.idController);

    if (check3) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context, 
        barrierDismissible: false,
          builder: (context) {
        return AlertDialog(
          title: const Text('완료'),
          content: const Text('비밀번호가 변경되었습니다.'),
          actions: [
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())), 
            child: const Text('확인')),
          ],
        );
      },
      );
    }
  }
  // --- Functions ---
  // ignore: non_constant_identifier_names
  MySnackBar(BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('비밀번호가 일치하지않습니다'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
     ));
  }

  nullCheck(BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('비밀번호를 입력해주세요.'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
     ));
  }
  


 } // end