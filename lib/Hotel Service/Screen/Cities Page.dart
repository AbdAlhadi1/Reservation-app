import 'package:flutter/material.dart';
import 'package:reservationapp/Hotel%20Service/Widget/City%20item.dart';
import '../../Classes/Cities.dart';
import '../../Classes/User.dart';
import '../Widget/Get Hotles.dart';

// ignore: must_be_immutable
class CitiesPage extends StatelessWidget {
  Cities cities ;
  User user;
  CitiesPage({super.key,required this.cities,required this.user});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetHotels(user: user,cityName: cities.citiesArray[i].cityName,id: cities.citiesArray[i].id,)));
                }),
              )
            ],
          ),
        )
    );
  }
}
