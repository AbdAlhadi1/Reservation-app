
import 'package:flutter/material.dart';
import 'package:reservationapp/Hotel%20Service/Widget/City%20item.dart';
import 'package:reservationapp/User%20Info/Screen/Reservation%20Deatils.dart';

import '../../Classes/User.dart';

class ListMyReservationPage extends StatelessWidget {
  User user;
  var info;
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  ListMyReservationPage({super.key,required this.user,required this.info});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text("My Reservations",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: thirdColor
          ),),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 25,),
            for(int i=0;i<info.length;i++)Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ReservationItem(date: info["start_date"],institutionName:info["carcompany_name"],user:user,info: info[i],),
            )
          ],
        ),
      ),
    );
  }
}



class ReservationItem extends StatelessWidget {
  var info;
  String institutionName , date;
  User user;
  ReservationItem({super.key,required this.user,required this.date,required this.institutionName,required this.info});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReservationDetailsPage(user: user,info:info,)));
      },
      child:   SizedBox(
        height: 75,
        child: Card(
          margin:  const EdgeInsets.only(left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
               institutionName,
               style: TextStyle(
                 fontSize: 18,
                 color: secondColor,
                 fontWeight: FontWeight.w600
               ),
              ),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
