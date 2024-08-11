import 'package:flutter/material.dart';

import '../../Classes/Hotel Details.dart';
import '../../Classes/User.dart';
import 'Reservation Page.dart';

class SecondHotelDetailsPage extends StatefulWidget {
  int hotelId;
  List<HotelStays> hotelStays;
  String hotelName;
  User user;
  SecondHotelDetailsPage({super.key,required this.hotelStays,required this.hotelName,required this.user,required this.hotelId});

  @override
  State<SecondHotelDetailsPage> createState() => _SecondHotelDetailsPageState();
}

class _SecondHotelDetailsPageState extends State<SecondHotelDetailsPage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  List op = ["good deal for a small family or 4 to 5 persons ", "good deal for big family more than 7 person","the most ordered and good deal for 1 to 2 person"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(widget.hotelName,style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),
        body: ListView(
          children: [

            const SizedBox(height: 40,),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("ROOM TYPE",style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),),
            ),

            for(int i=0;i<widget.hotelStays.length;i++)Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 10),
              child: StayItem(user: widget.user,name: widget.hotelStays[i].stayType, price: widget.hotelStays[i].price,description:widget.hotelStays[i].description,stayId: widget.hotelStays[i].stayId,hotelId: widget.hotelId),
            )
          ],
        ),
      ),
    );
  }
}




class StayItem extends StatelessWidget {
  String name,price,description;
  User user;
  int stayId,hotelId;
  StayItem({super.key,required this.name,required this.price,required this.description,required this.user,required this.stayId,required this.hotelId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelReservationPage(user: user,price: price,roomType: name,stayId: stayId,hotelId: hotelId,)));

      },
      child: Card(
        margin: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(name,style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),),
            ),

            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(description,style: const TextStyle(
                  fontSize: 17,

              ),),
            ),
            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("\$ $price",style: const TextStyle(
                fontSize: 17,

                color: Colors.green
              ),),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
