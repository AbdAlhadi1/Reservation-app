import 'package:flutter/material.dart';
import 'package:reservationapp/Signup/Api/Signup%20Api.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class SendSignupData extends StatelessWidget {

  TextEditingController  passwordController, firstNameController, lastNameController, emailController, ageController,phoneController;
  String username,city;
  SendSignupData({
    super.key,
    required this.username,
    required this.phoneController,
    required this.city,
    required this.ageController,
    required this.emailController,
    required this.lastNameController,
    required this.firstNameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    SignupApi ob = SignupApi();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ob.signup(username, city, passwordController, firstNameController, lastNameController, emailController, ageController, phoneController),
          builder:(context, AsyncSnapshot<Tuple2<bool,String>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            } else if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!.item1 == true){
                return const Center(child: Text("done"),);
              } else {
                return AlertDialog(
                  title: const Text("ERROR"),
                  content: Text(snapshot.data!.item2),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text("OK"))
                  ],
                );
              }
            } else {
              return AlertDialog(
                title: const Text("ERROR"),
                content: Text(snapshot.data!.item2),
                actions: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text("OK"))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
