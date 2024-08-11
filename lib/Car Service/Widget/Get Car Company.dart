import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Api/Car%20Service%20Api.dart';
import 'package:reservationapp/Car%20Service/Screen/Car%20Company%20Page.dart';
import 'package:reservationapp/Classes/Car%20Company%20Object.dart';

import '../../Classes/User.dart';


class GetCarCompany extends StatelessWidget {
  String cityName;
  int id;
  User user;
  GetCarCompany({super.key,required this.cityName,required this.id,required this.user});

  @override
  Widget build(BuildContext context) {
    CarServiceApi ob = CarServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.showCarCompany(),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      CarCompanyObject carCompanyObject = snapshot.data!.item2;
                      return CarCompanyPage(user: user,carCompanyObject: carCompanyObject,cityName: cityName,id: id,secondCarCompanyObject: carCompanyObject,);
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
