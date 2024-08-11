import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel%20Object.dart';
import 'package:reservationapp/Classes/Hotel.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';

import '../../Classes/User.dart';
import '../../my_field.dart';
import '../Widget/Get Search Result.dart';

class HotelsPage extends StatefulWidget {
  HotelObject hotelObject;
  HotelObject secondHotelObject;
  int cityId;
  String cityName;
  User user;
  HotelsPage({super.key,required this.user,required this.hotelObject,required this.cityName,required this.cityId,required this.secondHotelObject});

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}




class _HotelsPageState extends State<HotelsPage> {

  @override
  void initState() {
    List<OneHotel> op = [];
    for(int i=0;i<widget.hotelObject.oneHotel.length;i++){
      if(widget.hotelObject.oneHotel[i].cityId == widget.cityId){
        op.add(widget.hotelObject.oneHotel[i]);
      }
    }
    HotelObject newHotelObject = HotelObject(count: widget.hotelObject.count, nextUrl: widget.hotelObject.nextUrl, previousUrl: widget.hotelObject.previousUrl, oneHotel: op);
    widget.hotelObject = newHotelObject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
        body:(widget.cityId != -1) ? (widget.hotelObject.oneHotel.length != 0) ? ListView(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelsFromSearch(user: widget.user,wordToSearch: searchController)));
                  },
                ),
              ),

              const SizedBox(height: 5,),
              for(int i=0;i<widget.hotelObject.oneHotel.length;i++)Padding(
                padding: const EdgeInsets.only(top: 9,bottom: 9),
                child: HotelItem(user: widget.user,oneHotel: widget.hotelObject.oneHotel[i],cityName: widget.cityName,directBooking: false,reservationDetails: false),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetHotelsFromSearch(user: widget.user,wordToSearch: searchController)));
                },
              ),
            ),

            const SizedBox(height: 5,),
            for(int i=0;i<widget.secondHotelObject.oneHotel.length;i++) Padding(
              padding: const EdgeInsets.only(top: 9,bottom: 9),
              child: HotelItem(user: widget.user,oneHotel: widget.hotelObject.oneHotel[i],cityName: "",directBooking: false),
            ),
          ],
        )
      ),
    );
  }
}

