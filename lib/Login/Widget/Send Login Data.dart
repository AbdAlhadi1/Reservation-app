import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Home%20Page/Screen/Home%20Page.dart';
import 'package:reservationapp/Login/Api/loginApi.dart';

import '../../Classes/User.dart';

// ignore: must_be_immutable
class SendLoginData extends StatelessWidget {
  TextEditingController usernameController,passwordController;
  SendLoginData({super.key, required this.usernameController,required this.passwordController});

  @override
  Widget build(BuildContext context) {
    LoginApi ob = LoginApi();
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: FutureBuilder(
              builder:(context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.data!.item1 == true){
                    User user = snapshot.data!.item2;
                    return HomePage(user: user,);
                  } else {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(snapshot.data!.item2),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("OK"))
                      ],
                    );
                  }
                }  else {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: Text(snapshot.data!.item2),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text("OK"))
                    ],
                  );
                }
              },
              future: ob.login(usernameController, passwordController),
            ),
          ),
        )
    );
  }
}
