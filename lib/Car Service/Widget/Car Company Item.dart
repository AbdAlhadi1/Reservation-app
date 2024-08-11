import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Screen/Car%20Page.dart';
import 'package:reservationapp/Car%20Service/Widget/Get%20Car%20For%20Car%20Company.dart';
import 'package:reservationapp/Classes/One%20Car%20Company.dart';

import '../../Classes/User.dart';





// ignore: must_be_immutable
class RatingStars extends StatelessWidget {
  int coloredStar;
  RatingStars({
    super.key,
    required this.coloredStar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(int i=0;i<coloredStar;i++)const Icon(Icons.star,color: CupertinoColors.activeOrange),
        for(int i=0;i<5-coloredStar;i++)const Icon(Icons.star_border,color: CupertinoColors.activeOrange)
      ],
    );
  }
}







class CarCompanyItem extends StatelessWidget {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  String cityName;
  User user;
  bool directBooking;
  final reservationDetails;
  OneCarCompany oneCarCompany;
  CarCompanyItem({super.key,required this.oneCarCompany,required this.user,required this.cityName,required this.directBooking,this.reservationDetails});

  @override
  Widget build(BuildContext context) {
    String creationDate = "";
    for(int i=0;i<oneCarCompany.carCompanyDate.length;i++){
      if(oneCarCompany.carCompanyDate[i] != 'T'){
        creationDate += oneCarCompany.carCompanyDate[i];
      } else {
        break;
      }
    }
    return InkWell(
      onTap: (){

      },
      child: Card(
        margin: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Image(image: NetworkImage(oneCarCompany.carCompanyMainPhoto),fit: BoxFit.fill,)
            ),
            const SizedBox(height:10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(oneCarCompany.carCompanyName,style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                RatingStars(coloredStar:int.parse(oneCarCompany.numberOfRates[0])),
              ],
            ),
            Padding(
              padding:  const EdgeInsets.only(left: 50,top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email_rounded,color: secondColor,),
                      const SizedBox(width: 30,),
                      Text(oneCarCompany.carCompanyEmail,style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: secondColor,),
                      const SizedBox(width: 30,),
                      Text(creationDate ,style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Icon(Icons.location_on,color: secondColor,),
                      const SizedBox(width: 30,),
                      Text("${oneCarCompany.carCompanyCountry} - $cityName",style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Icon(Icons.phone,color: secondColor,),
                      const SizedBox(width: 30,),
                      Text(oneCarCompany.carCompanyPhone,style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,),
            Visibility(
              visible: (reservationDetails) ?false :true ,
              child: Row(
                mainAxisAlignment: (directBooking)?MainAxisAlignment.center:MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: (directBooking)? false:true,
                    child: ElevatedButton(onPressed: (){
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelDetails(hotelId: oneHotel.hotelId,oneHotel: oneHotel,)));
                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: secondColor,
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
                      ), child: Text("More Details",style: TextStyle(
                        color: thirdColor,
                      ),),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetCarForCarCompany(user: user,carCompanyId: oneCarCompany.carCompanyId,carCompanyName: oneCarCompany.carCompanyName,city:cityName,)));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CarsPage()));
                  },style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
                  ), child: Text("Show Cars",style: TextStyle(
                      color: thirdColor
                  ),)),
                ],
              ),
            ),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
