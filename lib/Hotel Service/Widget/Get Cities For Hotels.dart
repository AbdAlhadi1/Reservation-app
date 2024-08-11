import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Cities.dart';
import 'package:reservationapp/Hotel%20Service/Api/Hotel%20Service%20Api.dart';
import 'package:reservationapp/Hotel%20Service/Screen/Cities%20Page.dart';

import '../../Classes/User.dart';
import '../Screen/Hotels Page.dart';


class GetCitiesForHotels extends StatelessWidget {
  User user;
  GetCitiesForHotels({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    HotelServiceApi ob = HotelServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.getCities(),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      Cities cities = snapshot.data!.item2;
                      return CitiesPage(cities: cities,user: user,);
                    } else {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: Text(snapshot.data!.item2[0]),
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
                      content: Text(snapshot.data!.item2[0].toString()),
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
