
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Signup/Widget/Send%20Signup%20Data.dart';
import 'package:reservationapp/my_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true , isVisible1 = true;
  String city = "";
  String gender = "";
  String genderError = "", cityError = "";
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  List cities = ["Latakia","Damascus","Homs","Aleppo","Hama","Tartus", "Daraa","Deir ez-Zor","Al-Hasakah","Quneitra","Raqqa","As-Suwayda"];

  bool checkForm(){
    var op = formKey.currentState;
    return op!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
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
                          child: Text("Sign Up",style: TextStyle(
                            color: thirdColor,
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
                                  color: thirdColor
                              ),),
                            ),
                            MyFild(
                              preffixIcon: Icon(Icons.person,size: 22,color: thirdColor),
                              contorller: firstNameController,
                              hintText: "First Name",
                              inputTextColor: thirdColor,
                              obscure: false,
                              readOnly: false,
                              rightPadding: 20.0,
                              leftPadding: 20.0,
                              color: mainColor ,
                              sidesColor: secondColor,
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
                                  color: thirdColor
                              ),),
                            ),
                            MyFild(
                              preffixIcon: Icon(Icons.person,size: 22,color: thirdColor,),
                              contorller: lastNameController,
                              obscure: false,
                              inputTextColor: thirdColor,
                              readOnly: false,
                              hintText: "Last Name",
                              rightPadding: 20.0,
                              leftPadding: 20.0,
                              color: mainColor ,
                              sidesColor: secondColor,
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
                              color: thirdColor
                          ),),
                        ),


                        MyFild(
                          contorller: userNameController,
                          obscure: false,
                          inputTextColor: thirdColor,
                          preffixIcon:Icon(Icons.person,size: 22,color: thirdColor,),
                          hintText: "UserName",
                          borderRadius: BorderRadius.circular(12),
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          height: 70.5,
                          width: MediaQuery.of(context).size.width,
                          color: mainColor ,
                          sidesColor: secondColor,
                          val:(_){
                            if(emailController.text.isEmpty){
                              return "required";
                            } else {
                              return null;
                            }
                          },
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
                              color: thirdColor
                          ),),
                        ),


                        MyFild(
                            contorller: emailController,
                            obscure: false,
                            inputTextColor: thirdColor,
                            preffixIcon:Icon(Icons.email,size: 22,color: thirdColor,),
                            hintText: "Email",
                            borderRadius: BorderRadius.circular(12),
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            height: 70.5,
                            width: MediaQuery.of(context).size.width,
                            color: mainColor ,
                            sidesColor: secondColor,
                            val:(_){
                              if(emailController.text.isEmpty){
                                return "required";
                              } else {
                                if(!EmailValidator.validate(emailController.text)){
                                  return "please enter correct email";
                                } else {
                                  return null;
                                }
                              }
                            },
                        ),
                      ],
                    ),

                    const SizedBox(height: 5,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("Password",style: TextStyle(
                            color: thirdColor
                          ),),
                        ),
                        MyFild(
                            contorller: passwordController,
                            obscure: isVisible,
                            inputTextColor: thirdColor,
                            borderRadius: BorderRadius.circular(12),
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            height: 70.5,
                            width: MediaQuery.of(context).size.width,
                            color: mainColor ,
                            sidesColor: secondColor,
                            hintText: "Password",
                            preffixIcon:Icon(Icons.password,size: 22,color: thirdColor,),
                            maxLine: 1,
                            suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                            }, icon: (isVisible == true ) ?Icon(Icons.visibility_off,color: thirdColor,):Icon(Icons.visibility,color: thirdColor,)),
                            val: (_){
                              if(passwordController.text.isEmpty){
                                return "required";
                              } else {
                                if(passwordController.text.length<8){
                                  return "password should contain 8 digit";
                                } else {
                                  return null;
                                }
                              }
                            },
                        ),
                      ],
                    ),

                    const SizedBox(height: 5,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 25),
                          child: Text("Confirm Password",style: TextStyle(
                              color: thirdColor
                          ),),
                        ),
                        MyFild(
                          inputTextColor: thirdColor,
                          contorller: confirmPasswordController,
                          obscure: isVisible1,
                          borderRadius: BorderRadius.circular(12),
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          height: 70.5,
                          width: MediaQuery.of(context).size.width,
                          color: mainColor ,
                          sidesColor: secondColor,
                          hintText: "Confirm Password",
                          preffixIcon:Icon(Icons.password,size: 22,color: thirdColor,),
                          maxLine: 1,
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              isVisible1 = !isVisible1;
                            });
                          }, icon: (isVisible1 == true ) ?Icon(Icons.visibility_off,color: thirdColor,):Icon(Icons.visibility,color: thirdColor,) ),
                            val: (_){
                              if(confirmPasswordController.text.isEmpty){
                                return "required";
                              } else {
                                if(confirmPasswordController.text != passwordController.text ){
                                  return "password is not matching ";
                                } else {
                                  return null;
                                }
                              }
                            }
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
                              color: thirdColor
                          ),),
                        ),
                        MyFild(
                            inputTextColor: thirdColor,
                            preffixIcon: Icon(Icons.phone,size: 22,color: thirdColor,),
                            contorller: phoneController,
                            hintText: "Phone Number",
                            obscure: false,
                            borderRadius: BorderRadius.circular(12),
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            height: 70.5,
                            width: MediaQuery.of(context).size.width,
                            color: mainColor ,
                            sidesColor: secondColor,
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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 26.0),
                          child: Text("Age",style: TextStyle(
                              color: thirdColor
                          ),),
                        ),
                        MyFild(
                          inputTextColor: thirdColor,
                          contorller: ageController,
                          hintText: "Age",
                          obscure: false,
                          readOnly: false,
                          color: mainColor ,
                          sidesColor: secondColor,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          keyboardType: TextInputType.number,
                          borderRadius: BorderRadius.circular(12),
                          height: 70.5,
                          width: MediaQuery.of(context).size.width,
                          val: (_){
                            if(ageController.text.isEmpty){
                              return "required";
                            } else {
                              int age = int.parse(ageController.text);
                              if(age<18){
                                return "you should be over 18 to sign up";
                              } else if(age > 200){
                                return "please enter a valid age";
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
                          dropdownColor:  const Color(0xFF262B44),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFed3954),
                                  )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFed3954),
                                  ))),
                          style: const TextStyle(
                            color: Colors.white,
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
                          hint: const Text(
                            '    City',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),

                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(cityError,style: const TextStyle(
                        color: Colors.red
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30 ,),
                      child: Row(
                        children: [
                          const Text("Gender : ",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20)),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text("Male",
                              style: TextStyle(color: Colors.white)),
                          Radio(
                            activeColor: secondColor,
                            focusColor: secondColor,
                            value: "Male",
                            groupValue: gender,
                            onChanged: (val1) {
                              setState(() {
                                gender = val1.toString();
                              });
                            },
                          ),

                          const Text("Female",
                              style: TextStyle(color: Colors.white)),
                          //const SizedBox(width: 2,),
                          Radio(
                              activeColor: secondColor,
                              focusColor: secondColor,
                              value: "Female",
                              groupValue: gender,
                              onChanged: (val1) {
                                setState(() {
                                  gender = val1.toString();
                                });
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(genderError,style: const TextStyle(
                        color: Colors.red,
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
                                if(gender == ""){
                                  setState(() {
                                    genderError = "required";
                                  });
                                } else {
                                  setState(() {
                                    genderError = "";
                                  });
                                }
                                if(checkForm() && city !="" && gender!=""){
                                  String username = "";
                                  for(int i=0;i<emailController.text.length;i++){
                                    if(emailController.text[i]!='@') {
                                      username+=emailController.text[i];
                                    } else {
                                      break;
                                    }
                                  }
                                  print(username);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendSignupData(username: userNameController, phoneController: phoneController, city: city, ageController: ageController, emailController: emailController, lastNameController: lastNameController, firstNameController: firstNameController, passwordController: passwordController
                                  )));
                                }

                        }, child:Text("Signup",style: TextStyle(
                          color: thirdColor,
                          fontSize: 18
                        ),) ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
