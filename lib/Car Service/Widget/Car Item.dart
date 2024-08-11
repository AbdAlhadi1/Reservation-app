import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Screen/Car%20Reservation%20Page.dart';
import 'package:reservationapp/Classes/Car%20Object.dart';

import '../../Classes/User.dart';


// ignore: must_be_immutable
class CarItem extends StatelessWidget {
  CarObject carObject;
  User user;
  String city;
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  CarItem({super.key,required this.carObject,required this.user,required this.city});

  @override
  Widget build(BuildContext context) {
    //   https://edgecast-img.yahoo.net/mysterio/api/983CCB80DA7F07223B632331CCA4B9558D9C553392825271D16765A48A02E8E9/autoblog/resizefill_w768_h432;quality_85;format_webp;cc_31536000;/https://s.aolcdn.com/commerce/autodata/images/USD30TOC021G021001.jpg
    return  InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CarReservationPage(user: user,carCompanyId:carObject.carCompanyId ,carId:carObject.carId ,city:city ,price: carObject.price,)));
      },
      child: Card(
        margin: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Image(image: NetworkImage(carObject.carImages[0].image),fit: BoxFit.fill,)
            ),
            const SizedBox(height:10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,bottom: 5),
                  child: Text(" Car Information : ",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Car Name :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text(carObject.carName)
                ],
              ),
            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const  EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Car Number :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text(carObject.carNumber)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding:const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Car Type :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text(carObject.carType)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Car Capacity :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text("${carObject.carCapacity}")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding:const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Contain Baby Seat :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text((carObject.containBabeSeat) ? "YES" : "NO")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding:const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price Per Day :",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text("\$ ${carObject.price}")
                ],
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
