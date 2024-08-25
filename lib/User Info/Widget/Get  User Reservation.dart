import 'package:flutter/material.dart';
import 'package:reservationapp/User%20Info/Api/User%20Info%20Api.dart';
import 'package:reservationapp/User%20Info/Screen/List%20My%20Reservation.dart';

import '../../Classes/User.dart';


class GetUserReservation extends StatelessWidget {
  User user;
  GetUserReservation({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    UserInfoApi ob = UserInfoApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.getAllUserCarReservation(user.userName),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return ListMyCarReservationPage(user: user, info: snapshot.data!.item2,);
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
