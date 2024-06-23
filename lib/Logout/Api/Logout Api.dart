


import 'dart:convert';

import 'package:http/http.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

class LogoutAPi{

  Future logout (String userName) async {
    try{
      
      Response response = await delete(Uri.parse("${UserUrls.userServiceBaseUrl}${UserUrls.logoutUrl}$userName"));
      if(response.statusCode == 200){
        print("logout successful ${response.statusCode}");
        return const Tuple2(true, "done");

      } else {
        print("logout failed ${response.statusCode}");
        print("the error is  : ${jsonDecode(response.body)}");
        return const Tuple2(false, "failed");

      }
      
    }catch(e){
      print("tha catched  error is ${e.toString()}");
      return Tuple2(false, e.toString());
    }
  }


}