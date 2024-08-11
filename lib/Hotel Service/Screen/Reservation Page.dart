import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservationapp/Hotel%20Service/Widget/Book%20Hotel.dart';

import '../../Classes/User.dart';
import '../../my_field.dart';
//import 'package:intl/intl.dart';

class HotelReservationPage extends StatefulWidget {
  String price,roomType;
  int stayId,hotelId;
  User user;
  HotelReservationPage({super.key,required this.price,required this.roomType,required this.user,required this.stayId,required this.hotelId});

  @override
  State<HotelReservationPage> createState() => _HotelReservationPageState();
}

class _HotelReservationPageState extends State<HotelReservationPage> {

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController  confirmReservation = TextEditingController();
  bool go = false;
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  int count = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool check(){
    var op = formKey.currentState;
    return op!.validate();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController(
        text: widget.user.firstName
    );
    TextEditingController lastNameController = TextEditingController(
        text: widget.user.lastName
    );
    TextEditingController phoneController = TextEditingController(
        text: widget.user.phone
    );
    TextEditingController userNameController = TextEditingController(
        text: widget.user.userName
    );
    TextEditingController emailController = TextEditingController(
        text: widget.user.email
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(widget.roomType,style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 25,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Check Information",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
            const SizedBox(height: 25,),

            Row(
              children: [
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(left: 25),
                      child: Text("First Name",style: TextStyle(
                          color: mainColor
                      ),),
                    ),

                    MyFild(
                      preffixIcon: Icon(Icons.person,size: 22,color: secondColor),
                      contorller: firstNameController,
                      hintText: "First Name",
                      inputTextColor: Colors.black,
                      obscure: false,
                      readOnly: true,
                      rightPadding: 20.0,
                      leftPadding: 20.0,
                      color: thirdColor ,
                      sidesColor: mainColor,
                      borderRadius: BorderRadius.circular(12),
                      height: 70.5,
                      width: 150.0,
                      maxLine: 1,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(left: 25),
                      child: Text("Last Name",style: TextStyle(
                          color: mainColor
                      ),),
                    ),
                    MyFild(
                      preffixIcon: Icon(Icons.person,size: 22,color: secondColor,),
                      contorller: lastNameController,
                      obscure: false,
                      inputTextColor: Colors.black,
                      readOnly: true,
                      hintText: "Last Name",
                      rightPadding: 20.0,
                      leftPadding: 20.0,
                      color: thirdColor,
                      sidesColor: mainColor,
                      borderRadius: BorderRadius.circular(12),
                      height: 70.5,
                      width: 150.0,
                      maxLine: 1,
                    ),
                  ],
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.only(left: 25),
                  child: Text("UserName",style: TextStyle(
                      color: mainColor
                  ),),
                ),


                MyFild(
                  contorller: userNameController,
                  obscure: false,
                  inputTextColor: Colors.black,
                  preffixIcon:Icon(Icons.person,size: 22,color: secondColor,),
                  hintText: "UserName",
                  borderRadius: BorderRadius.circular(12),
                  readOnly: true,
                  rightPadding: 20.0,
                  leftPadding: 20.0,
                  height: 70.5,
                  width: MediaQuery.of(context).size.width,
                  color: thirdColor ,
                  sidesColor: mainColor,
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.only(left: 25),
                  child: Text("Email",style: TextStyle(
                      color: mainColor
                  ),),
                ),


                MyFild(
                  contorller: emailController,
                  obscure: false,
                  inputTextColor: Colors.black,
                  preffixIcon:Icon(Icons.email,size: 22,color: secondColor,),
                  hintText: "Email",
                  borderRadius: BorderRadius.circular(12),
                  readOnly: true,
                  rightPadding: 20.0,
                  leftPadding: 20.0,
                  height: 70.5,
                  width: MediaQuery.of(context).size.width,
                  color: thirdColor,
                  sidesColor: mainColor,
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text("Phone Number",style: TextStyle(
                      color: mainColor
                  ),),
                ),
                MyFild(
                  inputTextColor: Colors.black,
                  preffixIcon: Icon(Icons.phone,size: 22,color: secondColor,),
                  contorller: phoneController,
                  hintText: "Phone Number",
                  obscure: false,
                  borderRadius: BorderRadius.circular(12),
                  readOnly: true,
                  rightPadding: 20.0,
                  leftPadding: 20.0,
                  height: 70.5,
                  width: MediaQuery.of(context).size.width,
                  color: thirdColor,
                  sidesColor: mainColor,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                readOnly: true,
                style:  TextStyle(color: mainColor),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range,  size: 22,color: secondColor,),
                    hintText: "Start Date",
                    hintStyle: TextStyle(color: mainColor),
                    enabled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor))),
                onTap: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2030))
                      .then((value) {
                    setState(() {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd')
                              .format(value!)
                              .toString();
                    });
                  });
                },
                controller: startDateController,
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                readOnly: true,
                style: TextStyle(color: mainColor),
                decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.date_range,  size: 22,color: secondColor,),
                    hintText: "End Date",
                    hintStyle: TextStyle(color: mainColor),
                    enabled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor))),
                onTap: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2030))
                      .then((value) {
                    setState(() {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd')
                              .format(value!)
                              .toString();
                      DateTime d1 = DateTime.parse(endDateController.text);
                      DateTime d2 = DateTime.parse(startDateController.text);
                      Duration d= d1.difference(d2);
                      int op = d.inDays;
                      count = op;
                    });
                  });
                },
                controller: endDateController,
              ),
            ),




            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:EdgeInsets.only(bottom: 5),
                      child: Text('DAYS ',style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 80,
                          decoration:  BoxDecoration(
                              border: Border(
                                left: BorderSide(color: mainColor),
                                top: BorderSide(color: mainColor),
                                right: BorderSide(color: mainColor),
                                bottom: BorderSide(color: mainColor),
                              )),
                          child: Center(
                            child: Text(
                              (count>1)?'$count': "0",
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text((count > 0) ? "TOTAL : ${(double.parse(widget.price)*count).toStringAsFixed(2)} \$": "TOTAL 0.00",style: const TextStyle(
                            fontSize: 25,
                          ),),
                        ),

                      ],
                    ),
                    Padding(
                      padding:const  EdgeInsets.only(top: 5),
                      child: Text('\$ ${widget.price}',style: const TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: secondColor,
                                padding: const EdgeInsets.all(9)
                            ),
                            onPressed: (){
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Confirm Your Reservation"),
                                  content: Text("please Enter Your Password To Confirm Your Reservation"),
                                  actions: [
                                    Form(
                                      key: formKey,
                                      child: MyFild(
                                        contorller: confirmReservation,
                                        obscure: true,
                                        inputTextColor: Colors.black,
                                        preffixIcon:Icon(Icons.password,size: 22,color: secondColor,),
                                        hintText: "Password",
                                        borderRadius: BorderRadius.circular(12),
                                        readOnly: false,
                                        rightPadding: 20.0,
                                        leftPadding: 20.0,
                                        height: 70.5,
                                        width: MediaQuery.of(context).size.width,
                                        color: thirdColor,
                                        sidesColor: mainColor,
                                        maxLine: 1,
                                        val: (_){
                                          if(confirmReservation.text == widget.user.password){
                                            return null;
                                          } else {
                                            return "NOT MATCHING";
                                          }
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(onPressed: (){
                                          if(check()){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookHotel(user: widget.user, hotelId: widget.hotelId, stayId: widget.stayId, startDate: startDateController, endDate: endDateController)));
                                          }
                                        }, child: const Text("Book"))
                                      ],
                                    )
                                  ],
                                );
                              });

                            }, child: const Text("Book Now",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70
                        ),))
                      ],
                    )
                  ],
                )
            )

          ],
        ),
      )
    );
  }
}
