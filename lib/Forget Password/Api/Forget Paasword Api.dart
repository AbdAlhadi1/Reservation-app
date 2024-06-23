import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

class ForgetPasswordApi{

  Future<Tuple2<bool,String>> sendEmailForForgetPassword(TextEditingController emailController) async {
    try{
      Response response = await get(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.sendEmailAndReceiveVerificationCode+emailController.text.toString()),);

      if(response.statusCode == 200){
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(true, "done");
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false,jsonDecode(response.body).toString());
      }

    }catch(error){
      print(error);
      return Tuple2(false, error.toString());
    }
  }


  Future<Tuple2<bool,String>> sendVerificationCodeForForgetPassword(String verificationCode) async {
    try{
      Response response = await post(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.sendVerificationCode),
          body: {
            "code": verificationCode,
          });

      if(response.statusCode == 200){
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(true, "done");
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false,jsonDecode(response.body).toString());
      }

    }catch(error){
      print(error);
      return Tuple2(false, error.toString());
    }
  }


  Future<Tuple2<bool,String>> sendNewPasswordForForgetPassword(TextEditingController emailController , TextEditingController newPassword) async {
    try{
      Response response = await put(Uri.parse(UserUrls.userServiceBaseUrl+UserUrls.sendNewPasswordForForgetPassword),
          body: {
            "email": emailController.text,
            "password": newPassword.text,
          });

      if(response.statusCode == 200){
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(true, "done");
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false,jsonDecode(response.body).toString());
      }

    }catch(error){
      print(error);
      return Tuple2(false, error.toString());
    }
  }


}