
import 'package:flutter/material.dart';
import 'package:reservationapp/User%20Info/Widget/Update%20User%20Info.dart';

import '../../Classes/User.dart';
import '../../my_field.dart';


class UpdateUserInfoPage extends StatefulWidget {
  User user;
  UpdateUserInfoPage({super.key,required this.user});

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String city = "Lattakia",cityError = "";
  List cities = ["Latakia","Damascus","Homs","Aleppo","Hama","Tartus", "Daraa","Deir ez-Zor","Al-Hasakah","Quneitra","Raqqa","As-Suwayda"];

  bool checkForm(){
    var op = formKey.currentState;
    return op!.validate();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController(

    );
    TextEditingController lastNameController = TextEditingController(

    );
    TextEditingController phoneController = TextEditingController(

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
          title: Text("Update Info",style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.w600,
            fontSize: 26,

          ),),
        ),

        body: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.only(left: 27),
                        child: Text("Update Information",style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 37,
                            fontStyle: FontStyle.italic
                        ),),
                      )
                    ],
                  ),

                  const SizedBox(height: 25,),

                  Row(
                    children: [
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
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            color: thirdColor ,
                            sidesColor: mainColor,
                            borderRadius: BorderRadius.circular(12),
                            height: 70.5,
                            width: 150.0,
                            maxLine: 1,
                            val: (_){
                              if(firstNameController.text.isEmpty){
                                return "required";
                              } else {
                                return null;
                              }
                            },
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
                            readOnly: false,
                            hintText: "Last Name",
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            color: thirdColor ,
                            sidesColor: mainColor,
                            borderRadius: BorderRadius.circular(12),
                            height: 70.5,
                            width: 150.0,
                            maxLine: 1,
                            val: (_){
                              if(lastNameController.text.isEmpty){
                                return "required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 5,),

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

                  const SizedBox(height: 5,),

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

                  const SizedBox(height: 5,),

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
                        readOnly: false,
                        rightPadding: 20.0,
                        leftPadding: 20.0,
                        height: 70.5,
                        width: MediaQuery.of(context).size.width,
                        color: thirdColor ,
                        sidesColor: mainColor,
                        keyboardType: TextInputType.number,
                        val: (_){
                          if(phoneController.text.isEmpty){
                            return "required";
                          } else {
                            if(phoneController.text[0]!='0'&&phoneController.text[1]!='9'){
                              return "please enter correct syrian phone number";
                            } else if(phoneController.text.length<10) {
                              return "please enter correct syrian phone number";
                            } else {
                              return null;
                            }
                          }
                        },

                      ),
                    ],
                  ),

                  const SizedBox(height: 5,),

                  Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButtonFormField(
                        dropdownColor:  thirdColor,
                        decoration:  InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                )),
                            focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                ))),
                        style:  TextStyle(
                          color: mainColor,
                        ),
                        items: cities
                            .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              "     $e",
                              //textDirection: ui.TextDirection.rtl,
                            )))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            city = val.toString();
                          });
                        },
                        hint: Text(
                          '    $city',
                          style: TextStyle(color: mainColor),
                        ),
                      )),

                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(cityError,style: const TextStyle(
                        color: Colors.red
                    )),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left: 80,right: 80),
                              backgroundColor: secondColor
                          ),
                          onPressed: (){
                            if(city == ""){
                              setState(() {
                                cityError = "required";
                              });
                            } else {
                              setState(() {
                                cityError = "";
                              });
                            }
                            if(checkForm() && city !=""){
                              User user = User(id: widget.user.id, userName: widget.user.userName, image: "", city: city, email: widget.user.email, password: widget.user.password, phone: phoneController.text, lastName: lastNameController.text, firstName: firstNameController.text, age: widget.user.age, country: widget.user.country, balance: widget.user.balance);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateUserInfo(user: user,firstName: firstNameController,lastName: lastNameController,phone: phoneController,)));
                            }

                          }, child:Text("Update",style: TextStyle(
                          color: thirdColor,
                          fontSize: 18
                      ),) ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
