import 'package:flutter/material.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

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
          title: Text("Dubai Hotel",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: thirdColor
          ),),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: [
              for(int i=0;i<5;i++) const Padding(
                padding: EdgeInsets.only(top: 9,bottom: 9),
                child: HotelItem(),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

