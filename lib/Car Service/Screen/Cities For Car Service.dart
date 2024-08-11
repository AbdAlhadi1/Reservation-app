import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Widget/Get%20Car%20Company.dart';

import '../../Classes/Cities.dart';
import '../../Classes/User.dart';
import '../../Hotel Service/Widget/City item.dart';

class CitiesForCarService extends StatelessWidget {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  Cities cities;
  User user;
  CitiesForCarService({super.key,required this.cities,required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: secondColor,
            title: Text("CITIES",style: TextStyle(
              color: thirdColor,
              fontWeight: FontWeight.w600,
              fontSize: 26,

            ),),
          ),



          body: ListView(
            children: [
              for(int i=0;i<cities.citiesArray.length;i++)Padding(
                padding: const EdgeInsets.only(left: 15,right: 15, top: 10,bottom: 10),
                child: CityItem(image:cities.citiesArray[i].cityImage ,cityName:cities.citiesArray[i].cityName ,onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetCarCompany(user: user,cityName: cities.citiesArray[i].cityName,id: cities.citiesArray[i].id,)));
                }),
              )
            ],
          ),
        )
    );
  }
}
