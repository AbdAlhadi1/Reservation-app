import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel%20Object.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';

class HotelsPage extends StatefulWidget {
  HotelObject hotelObject;
  String cityName;
  HotelsPage({super.key,required this.hotelObject,required this.cityName});

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(widget.cityName,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: thirdColor
          ),),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: [
              for(int i=0;i<widget.hotelObject.oneHotel.length;i++) Padding(
                padding: const EdgeInsets.only(top: 9,bottom: 9),
                child: HotelItem(oneHotel: widget.hotelObject.oneHotel[i]),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

