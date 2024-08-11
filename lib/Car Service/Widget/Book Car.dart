import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Api/Car%20Service%20Api.dart';

import '../../Classes/User.dart';
import '../../Home Page/Screen/Home Page.dart';

class BookCar extends StatelessWidget {

  User user;
  int carId,carCompanyId;
  TextEditingController startDate,endDate,picLocation,delLocation;

  BookCar({super.key,required this.user,required this.carId,required this.carCompanyId,required this.startDate,required this.endDate,required this.picLocation,required this.delLocation});

  @override
  Widget build(BuildContext context) {
    CarServiceApi ob= CarServiceApi();
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future:ob.bookCar(carId, carCompanyId, user.id, startDate, endDate, picLocation, delLocation),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.data!.item1 == true){
                      //HotelDetails hotelDetails = snapshot.data!.item2;
                      return AlertDialog(
                        title: const Text("DONE"),
                        content: const Text("The Car Has Been Booked Successfully",style: TextStyle(
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
