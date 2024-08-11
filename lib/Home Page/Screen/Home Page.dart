import 'package:flutter/material.dart';
import 'package:reservationapp/Car%20Service/Widget/Get%20Cities%20For%20Cars%20Company.dart';
import 'package:reservationapp/Home%20Page/Widget/Category%20Item%20For%20Home%20Page.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Get%20Cities%20For%20Hotels.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Hotel%20Item.dart';
import 'package:reservationapp/User%20Info/Screen/Update%20User%20Info%20Page.dart';
import 'package:reservationapp/User%20Info/Widget/Get%20%20User%20Reservation.dart';
import '../../Classes/Hotel.dart';
import '../../Classes/User.dart';
import '../../drawer_components.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({super.key,required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListMyReservationPage()));
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateUserInfoPage()));
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelReservationPage(price: "200",roomType: "Suite",)));
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetSecondHotelDetails(hotelId: 3)));
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GetHotels()));
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HotelsPage()));

class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF262B44),
      secondColor = const Color(0xFFed3954),
      thirdColor = Colors.white;
  int currentBottomNavigationBarItem = 0;

  @override
  Widget build(BuildContext context) {
    OneHotel oneHotel = OneHotel(hotelId: 3, cityId: 2, hotelMainPhoto: "https://awsdayoubhotels.pythonanywhere.com/media/hotel_main_image/gb.jpeg", hotelName: "Golden Beach", hotelEmail: "b@gmailcom", hotelPhone: "+41444444", hotelCountry: "Syria", hotelCity: "", creationDate: "2024-08-01T", numberOfRates: "5.00", sumOfRates: "20.00");
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(
                height: 50,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  const EdgeInsets.only(left: 0),
                    child: Text("BOOK IT",style: TextStyle(
                        color: thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 37,
                        fontStyle: FontStyle.italic
                    ),),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding:  const EdgeInsets.only(left: 20,right: 20),
                    child: Text("book your hotel or rent your car in any place you are in in easy and fast way",style: TextStyle(
                        color: thirdColor,
                        fontSize: 17,
                        fontStyle: FontStyle.italic
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 45,),

              // hotel category item
              CategoryItemForHomePage(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GetCitiesForHotels(user: widget.user,)));
                },
                categoryName: "HOTELS",
                imageForTheCategory: "images/hotel.png",
              ),

              const SizedBox(
                height: 40,
              ),

              // cars category item
              CategoryItemForHomePage(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetCitiesForCarCompany(user: widget.user,)));
                  },
                  categoryName: "CARS",
                  imageForTheCategory: "images/car.png"),

              /*ElevatedButton(onPressed: (){
                scaffoldKey.currentState?.openDrawer();
              }, child: Text("a"))*/
              const SizedBox(height: 30,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Most Visited Companies",style: TextStyle(
                  color: thirdColor,
                  fontSize: 20,
              ))
              ],),
              const SizedBox(height: 20,),
              HotelItem(user: widget.user,oneHotel: oneHotel, cityName: "", directBooking: false,reservationDetails: false,)

            ],

          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: mainColor,
            onTap: (itemIndex) {
              setState(() {
                currentBottomNavigationBarItem = itemIndex;
              });
              if(itemIndex == 1){
                setState(() {
                  scaffoldKey.currentState?.openDrawer();
                });
              }
            },
            currentIndex: currentBottomNavigationBarItem,
            selectedItemColor: secondColor,
            unselectedItemColor: thirdColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
            ]),

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(
            "Home Page",
            style: TextStyle(
              color: thirdColor,
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color:mainColor),
                  accountName:  Text("${widget.user.firstName} ${widget.user.lastName}",style: TextStyle(color: thirdColor),),
                  accountEmail:  Text(widget.user.email,style: TextStyle(color: thirdColor),),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Drawer_component(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateUserInfoPage(user: widget.user,)));
                          },
                          text: "Update My information",
                          iconColor: secondColor,
                          color: mainColor,
                          icon: Icons.person),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Drawer_component(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetUserReservation(user: widget.user)));
                          },
                          text: "List My Reservation",
                          iconColor: secondColor,
                          color: mainColor,
                          icon: Icons.list),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Drawer_component(
                        onTap: () {

                        },
                        text: "Logout",
                        iconColor: secondColor,
                        color: mainColor,
                        icon: Icons.logout,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
