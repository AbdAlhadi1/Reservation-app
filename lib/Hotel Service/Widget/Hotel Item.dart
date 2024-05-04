import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;



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
  const HotelItem({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Card(
        margin: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: const Image(image: AssetImage("images/hoteltest.jpg"),fit: BoxFit.fill,)
            ),
            const SizedBox(height:10,),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("100 \$ Per Night",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Dubai Hotel",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                RatingStars(coloredStar: 3),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoomInfo(
                    informationName: "Bed",
                    numberForTheInformation: 3,
                    informationIcon: Icons.bed
                ),
                RoomInfo(
                    informationName: "Bath",
                    numberForTheInformation: 1,
                    informationIcon: Icons.bathtub
                ),
                RoomInfo(
                    informationName: "Wifi",
                    numberForTheInformation: 0,
                    informationIcon: Icons.wifi_off
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: const EdgeInsets.only(left: 17,right: 17,),
              child: const Text("ashdf kjhasjgf jsadg fhjg asdgfasj gfjhsga dfjhs gad fjhs gadhj sad jgfsj adhgf jshgad fjhsgdfj hsgadf hjsgad jfhgsa djfsaj dgfsajh sgkasdg kasgfks gfja ksgfja ksgksd gfjs akdf",style: TextStyle(
                fontSize: 16,
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){

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
