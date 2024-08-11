import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel%20Object.dart';
import 'package:reservationapp/Hotel%20Service/Api/Hotel%20Service%20Api.dart';
import '../../Classes/User.dart';
import '../Screen/Hotels Page.dart';


class GetHotels extends StatelessWidget {
  String cityName;
  int id;
  User user;
  GetHotels({super.key,required this.cityName,required this.id,required this.user});

  @override
  Widget build(BuildContext context) {
    HotelServiceApi ob = HotelServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.showHotels(),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      HotelObject hotelObject = snapshot.data!.item2;
                      return HotelsPage(user: user,cityName: cityName,hotelObject: hotelObject,cityId: id,secondHotelObject: hotelObject,);
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
                      content: Text(snapshot.data!.item2.toString()),
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
