import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

class LoginApi{
  Future <Tuple2<bool,List>> login (TextEditingController usernameController , TextEditingController passwordController) async{
    try{
      Response response = await post(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.loginUrl) , body: {
        "username" : usernameController.text,
        "password" : passwordController.text
      });

      if(response.statusCode == 200){

        print(response.statusCode);
        return const Tuple2(true , []);

      } else {

        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, []);

      }
    }catch(e){
      print("-------------------");
      print(e);
      return Tuple2(false, []);
    }
  }
}