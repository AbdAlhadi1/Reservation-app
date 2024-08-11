import 'package:flutter/material.dart';
import 'package:reservationapp/Forget%20Password/Screen/Enter%20Email%20For%20Forget%20Password%20Page.dart';
import 'package:reservationapp/Login/Widget/Send%20Login%20Data.dart';
import 'package:reservationapp/Signup/Screen/Signup%20page.dart';
import 'package:reservationapp/my_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  bool isVisible = true;
  bool formValidate() {
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
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45,bottom:3),
                    child: Text("Log In",style: TextStyle(
                        color: thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 37,
                        fontStyle: FontStyle.italic
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Text("Welcome Back ",style: TextStyle(
                        color: thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontStyle: FontStyle.italic
                    )),
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:const EdgeInsets.only(left: 25),
                                child: Text("Username",style: TextStyle(
                                    color: thirdColor
                                ),),
                              ),
                              MyFild(
                                contorller: usernameController,
                                hintText: "Username",
                                obscure: false,
                                inputTextColor: thirdColor,
                                readOnly: false,
                                rightPadding: 20.0,
                                leftPadding: 20.0,
                                color: mainColor,
                                sidesColor: secondColor,
                                preffixIcon: Icon(Icons.person,color: thirdColor,),
                                borderRadius: BorderRadius.circular(20),
                                height: 70.5,
                                width: MediaQuery.of(context).size.width,
                                val: (_) {
                                  if (usernameController.text.isEmpty) {
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
                                child: Text("Password",style: TextStyle(
                                    color: thirdColor
                                ),),
                              ),
                              MyFild(
                                maxLine: 1,
                                preffixIcon: Icon(Icons.password,color: thirdColor,),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: (isVisible)? Icon(Icons.visibility_off,color: thirdColor,):Icon(Icons.visibility,color: thirdColor,),
                                ),
                                inputTextColor: thirdColor,
                                contorller: passwordController,
                                hintText: "Password",
                                obscure: isVisible,
                                readOnly: false,
                                rightPadding: 20.0,
                                leftPadding: 20.0,
                                color: mainColor,
                                sidesColor: secondColor,
                                borderRadius: BorderRadius.circular(20),
                                height: 70.5,
                                width: MediaQuery.of(context).size.width,
                                val: (_) {
                                  if (passwordController.text.isEmpty) {
                                    return "required";
                                  } else {
                                    if (passwordController.text.length < 8) {
                                      return "the password have to contain at least 8 character";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EnterEmailForForgetPassword()));
                            },
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                              color: thirdColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondColor,
                        padding: const EdgeInsets.only(left: 100,right: 100)
                      ),
                      onPressed: () {
                        if(formValidate()){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SendLoginData(usernameController:usernameController, passwordController: passwordController)));
                        }
                      },
                      child: Text("LogIn",style: TextStyle(
                        fontSize: 18,
                        color: thirdColor
                      ),)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",style: TextStyle(
                      color: thirdColor,
                        fontSize: 16
                      ),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignupPage()));
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            color: secondColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
