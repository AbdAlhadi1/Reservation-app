import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Get%20Hotel%20Details.dart';

Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;



// ignore: must_be_immutable
class RoomInfo extends StatelessWidget {
  String informationName;
  int numberForTheInformation;
  IconData informationIcon;
  RoomInfo({
    super.key,
    required this.informationName,
    required this.numberForTheInformation,
    required this.informationIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(informationIcon,color: secondColor),
        (numberForTheInformation != 0) ? Text(" $numberForTheInformation  $informationName") : Text(" $informationName"),

      ],
    );
  }
}




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





class HotelItem extends StatelessWidget {
  OneHotel oneHotel;

  HotelItem({super.key,required this.oneHotel});
  @override
  Widget build(BuildContext context) {
    String creationDate = "";
    for(int i=0;i<oneHotel.creationDate.length;i++){
      if(oneHotel.creationDate[i] != 'T'){
        creationDate += oneHotel.creationDate[i];
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
                child: Image(image: NetworkImage(oneHotel.hotelMainPhoto),fit: BoxFit.fill,)
            ),
            const SizedBox(height:10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${oneHotel.hotelName} hotel",style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                RatingStars(coloredStar: 3),
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
                      Text(oneHotel.hotelEmail,style: const TextStyle(
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
                      Text(oneHotel.hotelCountry,style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Icon(Icons.phone,color: secondColor,),
                      const SizedBox(width: 30,),
                      Text(oneHotel.hotelPhone,style: const TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelDetails(hotelId: oneHotel.hotelId)));
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondColor,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
                  ), child: Text("More Details",style: TextStyle(
                    color: thirdColor,
                  ),),
                ),
                ElevatedButton(onPressed: (){
                },style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
                ), child: Text("Book Now",style: TextStyle(
                  color: thirdColor
                ),)),
              ],
            ),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
