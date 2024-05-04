import 'package:flutter/material.dart';
import 'package:reservationapp/Forget%20Password/Api/Forget%20Paasword%20Api.dart';
import 'package:reservationapp/Login/Screen/Login%20page.dart';
import 'package:tuple/tuple.dart';



class SendVerificationCodeForSignUp extends StatelessWidget {
  String code;
  TextEditingController emailController;
  SendVerificationCodeForSignUp({
    super.key,
    required this.code,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    ForgetPasswordApi ob = ForgetPasswordApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future: ob.sendVerificationCodeForForgetPassword(emailController, code),
              builder: (context,AsyncSnapshot<Tuple2<bool,String>> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      return const Login();
                    } else {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: Text(snapshot.data!.item2),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).canPop();
                          }, child: const Text("OK"))
                        ],
                      );
                    }
                  } else {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(snapshot.data!.item2),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).canPop();
                        }, child: const Text("OK"))
                      ],
                    );
                  }
                }
              },
            ),
          )
      ),
    );
  }
}
