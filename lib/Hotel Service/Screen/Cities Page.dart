import 'package:flutter/material.dart';
import 'package:reservationapp/Hotel%20Service/Widget/City%20item.dart';

import '../../Classes/Cities.dart';
import '../Widget/Get Hotles.dart';

class CitiesPage extends StatelessWidget {
  Cities cities ;
  CitiesPage({super.key,required this.cities});

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



          body: Column(
            children: [
              for(int i=0;i<cities.citiesArray.length;i++)Padding(
                padding: const EdgeInsets.only(left: 15,right: 15, top: 20,bottom: 20),
                child: CityItem(image:cities.citiesArray[i].cityImage ,cityName:cities.citiesArray[i].cityName ,onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetHotels(cityName: cities.citiesArray[i].cityName,)));
                }),
              )
            ],
          ),
        )
    );
  }
}
