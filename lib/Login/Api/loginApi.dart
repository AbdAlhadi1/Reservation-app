import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reservationapp/Classes/User.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

class LoginApi{
  Future  login (TextEditingController usernameController , TextEditingController passwordController) async{
    try{
      Response response = await post(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.loginUrl) , body: {
        "username" : usernameController.text,
        "password" : passwordController.text
      });

      if(response.statusCode == 200){
        print(jsonDecode(response.body));
        print(response.statusCode);
        var info = jsonDecode(response.body);
        User user = User(id: info["user"]["id"],userName: info["user"]["username"], image:"", city: info["user"]["city"], email: info["user"]["email"], password:info["user"]["password"], phone: info["user"]["phone"], lastName:info["user"]["last_name"], firstName: info["user"]["first_name"], age: info["user"]["age"], country: info["user"]["country"],balance: info["user"]["balance"]);
        //User user = User(userName: "userName", image: "", city: "", email: "", password: "", phone: "", lastName: "", firstName: "", age: 22, country: "", balance: 0);
        return  Tuple2(true , user);

      } else {

        print(response.statusCode);
        print(jsonDecode(response.body));
        return  Tuple2(false, jsonDecode(response.body).toString());

      }
    }catch(e){
      print("-------------------");
      print(e);
      return Tuple2(false, e.toString());
    }
  }
}