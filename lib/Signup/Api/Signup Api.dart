import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

class SignupApi{
  Map<String ,dynamic> toJson(
      String username,
      String city,
      TextEditingController passwordController,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController emailController ,
      TextEditingController ageController ,
      TextEditingController phoneController,){
    return{

      "username" : username,
      "password" : passwordController.text,
      "first_name" : firstNameController.text,
      "last_name" : lastNameController.text,
      "email" : emailController.text,
      "age" : ageController.text,
      "country" : "Syria",
      "city" : city,
      "phone" : phoneController.text,

    };
  }


  Future<Tuple2<bool,String>> signup(
      TextEditingController username,
      String city,
      TextEditingController passwordController,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController emailController ,
      TextEditingController ageController ,
      TextEditingController phoneController,
      ) async {
    try{
      print("helllllllllloooo");
      //final body = jsonEncode(toJson(username, city, passwordController, firstNameController, lastNameController, emailController, ageController, phoneController));
      print(username);
      print(passwordController.text);
      print(firstNameController.text);
      print(lastNameController.text);
      print(emailController.text);
      print(ageController.text);
      print(city);
      print(phoneController.text);
      print("helllllllllloooo111111111111111111");
      Response response = await post(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.signupUrl)
          ,body:{
            "username" : username.text,
            "password" : passwordController.text,
            "first_name" : firstNameController.text,
            "last_name" : lastNameController.text,
            "email" : emailController.text,
            "age" : ageController.text,
            "country" : "Syria",
            "city" : city,
            "phone" : phoneController.text
          },
      );
      print("helllllllllllllllooooooooooooooooooooooo22222222222222222");
      if(response.statusCode == 200){
        print(response.statusCode);
        print(jsonDecode(response.body));
        Tuple2<bool,String> done = const Tuple2(true, "done");
        return done;
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        Tuple2<bool,String> done = Tuple2(false,jsonDecode(response.body).toString() );
        return done;

      }

    }catch(e){
      print("this Error hase been catched $e" );
      Tuple2<bool,String> done = Tuple2(false, e.toString());
      return done;
    }
  }


}