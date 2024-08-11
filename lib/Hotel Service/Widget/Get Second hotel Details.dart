import 'package:flutter/material.dart';
import 'package:reservationapp/Home%20Page/Screen/Home%20Page.dart';
import 'package:reservationapp/Hotel%20Service/Screen/Second%20Hotel%20Details%20Page.dart';

import '../../Classes/User.dart';
import '../Api/Hotel Service Api.dart';

class GetSecondHotelDetails extends StatelessWidget {
  int hotelId;
  String hotelName;
  User user;
  GetSecondHotelDetails({super.key,required this.user,required this.hotelId,required this.hotelName});

  @override
  Widget build(BuildContext context) {
    HotelServiceApi ob = HotelServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.secondHotelDetails(hotelId),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return SecondHotelDetailsPage(hotelStays: snapshot.data!.item2, hotelName:hotelName,user: user,hotelId: hotelId,);
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
