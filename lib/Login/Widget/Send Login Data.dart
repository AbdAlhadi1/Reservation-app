import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Login/Api/loginApi.dart';
import 'package:tuple/tuple.dart';

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
              builder:(context, AsyncSnapshot<Tuple2<bool,List>>snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.data!.item1 == true){
                    return Container(
                      child: const Text("done"),
                    );
                  } else {
                    return  Container(
                      child: const Text("false"),
                    );
                  }
                }  else {
                  return  Container(
                    child: const Text("false"),
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
