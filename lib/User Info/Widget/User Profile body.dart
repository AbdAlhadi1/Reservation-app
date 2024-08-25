import 'package:flutter/material.dart';

import '../../Classes/User.dart';

class UserBody extends StatefulWidget {
  User user;
  UserBody({super.key,required this.user});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text("PROFILE",style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                  child:CircleAvatar(
                    backgroundImage:AssetImage("images/male.jpeg"),
                    radius: 90,
                  ),

              ),
              SizedBox(
                height:20,
              ),
              Text(
                widget.user.firstName +" "+ widget.user.lastName,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                widget.user.userName,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.red),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.user.email,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.user.country+"-"+widget.user.city,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone, color: Colors.red),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.user.phone,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.money, color: Colors.red),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.user.balance.toString()+" \$",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
