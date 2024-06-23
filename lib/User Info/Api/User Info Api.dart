

import 'dart:convert';

import 'package:http/http.dart';
import 'package:reservationapp/Classes/User.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoApi {

  void saveUserData (var info) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("username", info["username"]);
    await sp.setString("password", info["password"]);
    await sp.setString("firstName", info["first_name"]);
    await sp.setString("lastName", info["last_name"]);
    await sp.setString("email", info["email"]);
    await sp.setInt("age", info["age"]);
    await sp.setString("country", info["country"]);
    await sp.setString("city", info["city"]);
    await sp.setString("phoneNumber", info["phone"]);
  }


  Future updateUserInfo (User user) async {
    try{

      Response response = await put(Uri.parse("${UserUrls.userServiceBaseUrl}${UserUrls.editUserInfo}"),
        body: {
          "username": user.userName,
          "password": user.password,
          "first_name": user.firstName,
          "last_name":user.lastName,
          "email": user.email,
          "age": user.age,
          "country": user.country,
          "city": user.city,
          "phone": user.phone,
          "image": user.image,
        }
      );
      if(response.statusCode == 200){
        print("update user Info successful ${response.statusCode}");
        var info = jsonDecode(response.body);
        saveUserData(info);
        
      }


    }catch(e){

    }

  }

}