import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Api/Car%20Service%20Api.dart';
import 'package:reservationapp/Car%20Service/Screen/Cities%20For%20Car%20Service.dart';

import '../../Classes/Cities.dart';
import '../../Classes/User.dart';

class GetCitiesForCarCompany extends StatelessWidget {
  User user;
  GetCitiesForCarCompany({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    CarServiceApi ob = CarServiceApi();
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
                      return CitiesForCarService(user: user,cities: cities,);
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
