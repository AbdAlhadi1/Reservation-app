import 'package:flutter/material.dart';
import 'package:reservationapp/Classes/Hotel.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';

import '../../Classes/User.dart';

class ReservationDetailsPage extends StatelessWidget {
  User user;
  var info;
  ReservationDetailsPage({super.key,required this.user,required this.info});

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
    // hotel image   https://awsdayoubhotels.pythonanywhere.com/media/hotel_main_image/gb.jpeg
    // car image https://www.timescar-rental.com/images/top/top_ph001.png?20200120
    OneHotel oneHotel = OneHotel(hotelId: 0, cityId: 0, hotelMainPhoto: info["carcompany_image"], hotelName: info["carcompany_name"], hotelEmail: info["carcompany_email"], hotelPhone: info["carcompany_phone"], hotelCountry: info["carcompany_country"], hotelCity: "", creationDate: info["carcompany_datecreated"], numberOfRates: info["carcompany_numberofrates"], sumOfRates: "20.00");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text("Reservation Details",style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),
        body:ListView(
          children: [
            const SizedBox(height: 20,),
            HotelItem(user: user,oneHotel: oneHotel, cityName: "", directBooking: false,reservationDetails: true),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,bottom: 5),
                  child: Text(" User Information : ",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("First Name :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),),
                          Text(user.firstName)
                        ],
                      ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Last Name :",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          Text(user.lastName)
                        ],
                      ),
                  ),
                  const SizedBox(height: 10,),

                  Padding(
                    padding:const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Username :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(user.userName)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Email :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(user.email)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Company Name :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(info["car_company_name"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Car Type :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(info["car_type"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Price :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text("\$ "+info["price"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Price :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text("\$ " +info["calculate_total_price"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("From :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(info["start_date"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("To :",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text(info["end_date"])
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: (info ["is_car_reservation"] ) ? true : false ,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Receiving location :",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          Text("Awkaf Street")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: (info ["is_car_reservation"] ) ? true : false,
                      child: const Padding(
                      padding: EdgeInsets.only(left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery location :",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          Text("Awkaf Street")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ],
        ) ,
      ),
    ) ;
  }
}
