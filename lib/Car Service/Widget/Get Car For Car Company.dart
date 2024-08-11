
import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Api/Car%20Service%20Api.dart';
import 'package:reservationapp/Car%20Service/Screen/Car%20Page.dart';
import 'package:reservationapp/Classes/Car%20Object.dart';

import '../../Classes/User.dart';

class GetCarForCarCompany extends StatelessWidget {
  int carCompanyId;
  String carCompanyName,city;
  User user;
  GetCarForCarCompany({super.key,required this.user,required this.carCompanyId,required this.carCompanyName,required this.city});

  @override
  Widget build(BuildContext context) {
    CarServiceApi ob = CarServiceApi();
    return  SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.showCars(carCompanyId),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      List<CarObject> cars = snapshot.data!.item2;
                      return CarsPage(user: user,cars: cars,carCompanyName: carCompanyName,city: city,);
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
