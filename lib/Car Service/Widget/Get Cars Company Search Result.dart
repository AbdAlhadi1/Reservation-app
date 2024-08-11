import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Api/Car%20Service%20Api.dart';
import 'package:reservationapp/Car%20Service/Screen/Car%20Company%20Page.dart';
import 'package:reservationapp/Classes/Car%20Company%20Object.dart';

import '../../Classes/User.dart';



class GetCarsSearchResult extends StatelessWidget {
  TextEditingController wordToSearch;
  User user;
  GetCarsSearchResult({super.key,required this.user,required this.wordToSearch});

  @override
  Widget build(BuildContext context) {
    CarServiceApi ob = CarServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.searchCarCompany(wordToSearch),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      CarCompanyObject carCompanyObject = snapshot.data!.item2;
                      return CarCompanyPage(user: user,cityName: "Hotels",carCompanyObject: carCompanyObject ,id: -1,secondCarCompanyObject: carCompanyObject,);
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
