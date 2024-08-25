import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Widget/Car%20Company%20Item.dart';
import 'package:reservationapp/Car%20Service/Widget/Get%20Cars%20Company%20Search%20Result.dart';
import 'package:reservationapp/Classes/One%20Car%20Company.dart';

import '../../Classes/Car Company Object.dart';
import '../../Classes/User.dart';
import '../../my_field.dart';




class CarCompanyPage extends StatefulWidget {
  CarCompanyObject carCompanyObject,secondCarCompanyObject;
  String cityName;
  int id;
  User user;
  CarCompanyPage({super.key,required this.user,required this.carCompanyObject,required this.cityName,required this.id,required this.secondCarCompanyObject});

  @override
  State<CarCompanyPage> createState() => _CarCompanyPageState();
}

class _CarCompanyPageState extends State<CarCompanyPage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  TextEditingController searchController = TextEditingController();
  //OneCarCompany oneCarCompany = OneCarCompany(carCompanyId: 1, cityId: 1, carCompanyName: "MR Car", carCompanyEmail: "MR_Car@gmail.com", carCompanyCountry: "Syria", carCompanyCity: "", carCompanyDate: "2024 - 05 - 4", carCompanyMainPhoto: "https://www.timescar-rental.com/images/top/top_ph001.png?20200120", carCompanyPhone: "+963933223322", numberOfRates: "4", sumOfRates: "20");
  @override
  void initState() {
    List<OneCarCompany> op = [];
    for(int i=0;i<widget.carCompanyObject.carCompany.length;i++){
      if(widget.carCompanyObject.carCompany[i].cityId == widget.id){
        op.add(widget.carCompanyObject.carCompany[i]);
      }
    }
    CarCompanyObject newCarCompanyObject = CarCompanyObject(count: widget.carCompanyObject.count, nextUrl: widget.carCompanyObject.nextUrl, previousUrl: widget.carCompanyObject.previousUrl, carCompany: op);
    widget.carCompanyObject = newCarCompanyObject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: secondColor,
            title: Text(widget.cityName,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: thirdColor
            ),),
          ),
          body:(widget.id == -1) ? (widget.secondCarCompanyObject.carCompany.isEmpty)? const  Center(
            child: Text("There is No Car Company With This Name",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.grey,
            ),),
          ):ListView(
            children: [
              const SizedBox(height: 25,),
              const SizedBox(height: 5,),
              for(int i=0;i<widget.secondCarCompanyObject.carCompany.length;i++) Padding(
                padding: const EdgeInsets.only(top: 9,bottom: 9),
                child:CarCompanyItem(user: widget.user,oneCarCompany: widget.secondCarCompanyObject.carCompany[i], cityName: "", directBooking: true,reservationDetails: false,)
              ),
            ],
          ) : (widget.carCompanyObject.carCompany.isNotEmpty) ? ListView(
            children: [
              const SizedBox(height: 25,),
              MyFild(
                inputTextColor: Colors.black,
                contorller: searchController,
                obscure: false,
                hintText: "Search....",
                borderRadius: BorderRadius.circular(12),
                readOnly: false,
                rightPadding: 20.0,
                leftPadding: 20.0,
                height: 70.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                sidesColor: Colors.black38,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetCarsSearchResult(user: widget.user,wordToSearch: searchController)));
                  },
                ),
              ),

              const SizedBox(height: 5,),
              for(int i=0;i<widget.carCompanyObject.carCompany.length;i++)Padding(
                  padding: const EdgeInsets.only(top: 9,bottom: 9),
                  child: CarCompanyItem(user: widget.user,oneCarCompany: widget.carCompanyObject.carCompany[i], cityName: widget.cityName, directBooking: true,reservationDetails: false,)
              )
            ],
          ): const Center(
            child:  Text("There Is No Hotels Yet...",style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 28,
                color: Colors.grey
            ),),
          )
      ),
    );
  }
}





/*(widget.cityId != -1) ? (widget.hotelObject.oneHotel.length != 0) ? ListView(
            children: [
              const SizedBox(height: 25,),
              MyFild(
                inputTextColor: Colors.black,
                contorller: searchController,
                obscure: false,
                hintText: "Search....",
                borderRadius: BorderRadius.circular(12),
                readOnly: false,
                rightPadding: 20.0,
                leftPadding: 20.0,
                height: 70.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                sidesColor: Colors.black38,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelsFromSearch(wordToSearch: searchController)));
                  },
                ),
              ),

              const SizedBox(height: 5,),
              for(int i=0;i<widget.hotelObject.oneHotel.length;i++)Padding(
                padding: const EdgeInsets.only(top: 9,bottom: 9),
                child: HotelItem(oneHotel: widget.hotelObject.oneHotel[i],cityName: widget.cityName,directBooking: false,reservationDetails: false),
              )
            ],
          ): const Center(
            child:  Text("There Is No Hotels Yet...",style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 28,
                color: Colors.grey
            ),),
          )

              : ListView(
            children: [
              const SizedBox(height: 25,),
              MyFild(
                inputTextColor: Colors.black,
                contorller: searchController,
                obscure: false,
                hintText: "Search....",
                borderRadius: BorderRadius.circular(12),
                readOnly: false,
                rightPadding: 20.0,
                leftPadding: 20.0,
                height: 70.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                sidesColor: Colors.black38,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelsFromSearch(wordToSearch: searchController)));
                  },
                ),
              ),

              const SizedBox(height: 5,),
              for(int i=0;i<widget.hotelObject.oneHotel.length;i++) Padding(
                padding: const EdgeInsets.only(top: 9,bottom: 9),
                child: HotelItem(oneHotel: widget.hotelObject.oneHotel[i],cityName: "",directBooking: false),
              ),
            ],
          )*/
