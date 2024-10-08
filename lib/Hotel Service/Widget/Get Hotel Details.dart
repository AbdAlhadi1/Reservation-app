import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel%20Details.dart';
import 'package:reservationapp/Classes/Hotel%20Object.dart';
import 'package:reservationapp/Home%20Page/Screen/Home%20Page.dart';
import 'package:reservationapp/Hotel%20Service/Api/Hotel%20Service%20Api.dart';
import 'package:reservationapp/Hotel%20Service/Screen/First%20Hotel%20Details%20Page.dart';
import '../../Classes/Hotel.dart';
import '../../Classes/User.dart';
import '../Screen/Hotels Page.dart';


class GetHotelDetails extends StatelessWidget {
  int hotelId;
  OneHotel oneHotel;
  User user;
  GetHotelDetails({super.key,required this.user,required this.hotelId,required this.oneHotel});

  @override
  Widget build(BuildContext context) {
    HotelServiceApi ob = HotelServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.getHotelDetails(hotelId),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return FirstHotelDetailsPage(user: user,oneHotel: oneHotel, hotelFeatures: snapshot.data!.item2[1], hotelComments: snapshot.data!.item2[0], cityName: "");
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
