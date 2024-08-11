import 'package:flutter/material.dart';
import 'package:reservationapp/Home%20Page/Screen/Home%20Page.dart';
import 'package:reservationapp/Hotel%20Service/Api/Hotel%20Service%20Api.dart';

import '../../Classes/User.dart';

class BookHotel extends StatelessWidget {
  User user;
  int stayId,hotelId;
  TextEditingController startDate,endDate;
  BookHotel({super.key,required this.user,required this.hotelId,required this.stayId,required this.startDate,required this.endDate});

  @override
  Widget build(BuildContext context) {
    HotelServiceApi ob = HotelServiceApi();
    return  SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.bookHotel(hotelId, stayId, user.id, startDate, endDate),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return AlertDialog(
                        title: const Text("DONE"),
                        content: const Text("The Hotel Has Been Booked Successfully",style: TextStyle(
                          color: Colors.green,
                        ),),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage(user: user)));
                          }, child: const Text("OK"))
                        ],
                      );
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
