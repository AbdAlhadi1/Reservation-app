import 'package:flutter/material.dart';
import 'package:reservationapp/User%20Info/Screen/Hotel%20Reservation%20Details.dart';

import '../../Classes/User.dart';

class ListHotelReservation extends StatelessWidget {
  User user;
  var info;
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  ListHotelReservation({super.key,required this.user,required this.info});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text("My Hotel Reservations",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: thirdColor
          ),),
        ),
        body: (info.length == 0)? Center(
          child: Text("There is No Reservation Yet",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),),
        ):ListView(
          children: [
            const SizedBox(height: 25,),
            for(int i=0;i<info.length;i++)Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ReservationItem1(date: info[i]["start_date"],institutionName:info[i]["hotel_name"],user:user,info: info[i],),
            ),
          ],
        ),
      ),
    );
  }
}


class ReservationItem1 extends StatelessWidget {
  var info;

  String institutionName , date;
  User user;
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  ReservationItem1({super.key,required this.user,required this.date,required this.institutionName,required this.info,});

  @override
  Widget build(BuildContext context) {
    String date1= "";
    for(int i=0;i<date.length;i++){
      if(date[i]!="T")date1+=date[i];
      else break;
    }
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelReservationDetails(user: user,info:info,)));
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
                date1,
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