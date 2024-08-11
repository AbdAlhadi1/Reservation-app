import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Widget/Car%20Item.dart';

import '../../Classes/Car Object.dart';
import '../../Classes/User.dart';

class CarsPage extends StatefulWidget {
  List<CarObject> cars;
  String carCompanyName,city;
  User user;
  CarsPage({super.key,required this.cars,required this.carCompanyName,required this.user,required this.city});

  @override
  State<CarsPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarsPage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(widget.carCompanyName,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: thirdColor
          ),),
        ),

        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            for(int i=0;i<widget.cars.length;i++)Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: CarItem(carObject: widget.cars[i],user: widget.user,city:widget.city),
            )
          ],
        ),
      ),
    );
  }
}
