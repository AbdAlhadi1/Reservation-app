import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Forget%20Password/Screen/code_verification_page.dart';
import 'package:reservationapp/my_field.dart';


class SendEmailForForgetPassword extends StatefulWidget {
  const SendEmailForForgetPassword({super.key});

  @override
  State<SendEmailForForgetPassword> createState() => _SendEmailForForgetPasswordState();
}

class _SendEmailForForgetPasswordState extends State<SendEmailForForgetPassword> {
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool formCheck (){
    var op = formKey.currentState;
    return op!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: mainColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 175,),
                Center(
                  child: Text("Forget Password",style: TextStyle(
                    color: thirdColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),),
                ),
                const SizedBox(height: 7,),
                Center(
                  child: Text(
                    "Enter Your Email To Send verification Code",
                    style: TextStyle(
                      color: thirdColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                const SizedBox(height: 55,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:const EdgeInsets.only(left: 25),
                        child: Text("Email",style: TextStyle(
                            color: thirdColor
                        ),),
                      ),
                      MyFild(
                          preffixIcon: Icon(Icons.email,color: thirdColor,),
                          inputTextColor: thirdColor,
                          contorller: emailController,
                          obscure: false,
                          hintText: "Email",
                          borderRadius: BorderRadius.circular(12),
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          height: 70.5,
                          width: MediaQuery.of(context).size.width,
                          color: mainColor,
                          sidesColor: secondColor,
                          val: (_){
                            if(emailController.text.isEmpty){
                              return "required";
                            } else {
                              if(EmailValidator.validate(emailController.text)){
                                return null;
                              } else {
                                return "please enter valid email";
                              }
                            }
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                      padding: const EdgeInsets.only(left: 100,right: 100)
                    ),
                    onPressed: (){
                      if(formCheck()){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodeVerificationForForgetPasswordPage(email: emailController.text)));
                      }
                    },child: Text("Send",style: TextStyle(
                    color: thirdColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
