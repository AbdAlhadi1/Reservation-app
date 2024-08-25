import 'package:flutter/material.dart';
import 'package:reservationapp/Home%20Page/Screen/Home%20Page.dart';
import 'package:reservationapp/User%20Info/Api/User%20Info%20Api.dart';

import '../../Classes/User.dart';

class UpdateUserInfo extends StatelessWidget {
  User user;
  TextEditingController firstName,lastName,phone;
  UpdateUserInfo({super.key,required this.user,required this.firstName,required this.lastName,required this.phone});

  @override
  Widget build(BuildContext context) {
    UserInfoApi ob = UserInfoApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.updateUserInfo(user,firstName,lastName,phone),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return HomePage(user: snapshot.data!.item2);
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
                }
              },
            ),
          )
      ),
    );
  }
}
