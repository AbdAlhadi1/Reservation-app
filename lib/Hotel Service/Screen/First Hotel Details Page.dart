import 'package:flutter/material.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';

import '../../Classes/Hotel Details.dart';
import '../../Classes/Hotel.dart';
import '../../Classes/User.dart';

class FirstHotelDetailsPage extends StatefulWidget {
  OneHotel oneHotel;
  List<HotelComments> hotelComments;
  List<HotelFeatures> hotelFeatures;
  String cityName;
  User user;
  FirstHotelDetailsPage({super.key,required this.user,required this.oneHotel,required this.hotelFeatures,required this.hotelComments,required this.cityName});

  @override
  State<FirstHotelDetailsPage> createState() => _FirstHotelDetailsPageState();
}

class _FirstHotelDetailsPageState extends State<FirstHotelDetailsPage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    List <String> op = ["images/wifi.jpeg","images/coffe.jpg"];
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              const SizedBox(height: 20,),

              HotelItem(user:widget.user ,oneHotel: widget.oneHotel, cityName: widget.cityName,directBooking: true,reservationDetails: false),

              const SizedBox(height: 25,),
              Card(
                margin: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(" Features : ",style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ],
                    ),
                    for(int i=0;i<widget.hotelFeatures.length;i++) Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: Row(
                        children: [
                          Image(image: AssetImage(op[i]),width: 40,height: 40,),
                          const SizedBox(width: 10,),
                          Text(widget.hotelFeatures[i].name,style: const TextStyle(
                            fontSize: 17,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25,),
              Card(
                margin: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(" Comments : ",style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ],
                    ),
                    for(int i=0;i<widget.hotelComments.length;i++) Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.person,size: 35,color:secondColor,),
                          const SizedBox(width: 10,),
                          Text(widget.hotelComments[i].comment,style: const TextStyle(
                            fontSize: 17,
                          ),),
                        ],
                      ),
                    ),
                    (widget.hotelComments.isEmpty)? Container(
                      height: 150,
                      child: const Padding(
                        padding:  EdgeInsets.only(top: 75),
                        child:  Text(
                          "There is No Comment On This Hotel Yet...",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                        ),
                        ),
                      ),
                    ) : const Text(""),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}
