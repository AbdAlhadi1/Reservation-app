import 'package:flutter/material.dart';
import 'package:reservationapp/Home%20Page/Widget/Category%20Item%20For%20Home%20Page.dart';
import 'package:reservationapp/Hotel%20Service/Screen/Hotels%20Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  int currentBottomNavigationBarItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
          
              const SizedBox(height: 200,),
          
          
              // hotel category item
              CategoryItemForHomePage(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HotelsPage()));
                },
                categoryName: "HOTELS",
                imageForTheCategory: "images/hotel.png",
              ),

              const SizedBox(height: 20,),
          
              // restaurant category item
              CategoryItemForHomePage(
                  onTap: (){
          
                  },
                  categoryName: "RESTAURANT",
                  imageForTheCategory: "images/restaurant.png"
              ),

              const SizedBox(height: 20,),
          
              // cars category item
              CategoryItemForHomePage(
                  onTap: (){
          
                  },
                  categoryName: "CARS",
                  imageForTheCategory: "images/car.png"
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
            onTap: (itemIndex){
              setState(() {
                currentBottomNavigationBarItem = itemIndex;
              });
            },
            currentIndex: currentBottomNavigationBarItem,
            selectedItemColor: secondColor,
            unselectedItemColor: thirdColor,
            items:const[
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting")
            ]
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text("Home Page",style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),
      ),
    );
  }
}
