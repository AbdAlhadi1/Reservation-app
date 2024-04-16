import 'package:flutter/material.dart';
import 'package:reservationapp/my_field.dart';


class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true, isVisible1 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 140,),
                Center(
                  child: Text("Reset Password",style: TextStyle(
                      color: thirdColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),),
                ),
                const SizedBox(height: 7,),
                Center(
                  child: Text(
                    "Enter New Password",
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 80,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(left: 25),
                      child: Text("New Password",style: TextStyle(
                          color: thirdColor
                      ),),
                    ),
                    MyFild(
                        preffixIcon: Icon(Icons.password,color: thirdColor,),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: (isVisible)? (Icon(Icons.visibility_off,color: thirdColor,)):(Icon(Icons.visibility,color: thirdColor,)),
                        ),
                        inputTextColor: thirdColor,
                        contorller: passwordController,
                        hintText: "New Password",
                        obscure: isVisible,
                        borderRadius: BorderRadius.circular(12),
                        readOnly: false,
                        rightPadding: 20.0,
                        leftPadding: 20.0,
                        height: 70.5,
                        width: MediaQuery.of(context).size.width,
                        color: mainColor,
                        maxLine: 1,
                        sidesColor: secondColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height:10 ,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(left: 25),
                      child: Text("Confirm New Password",style: TextStyle(
                          color: thirdColor
                      ),),
                    ),
                    MyFild(
                      maxLine: 1,
                      preffixIcon: Icon(Icons.password,color: thirdColor,),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isVisible1 = !isVisible1;
                          });
                        },
                        icon: (isVisible1)? (Icon(Icons.visibility_off,color: thirdColor,)):(Icon(Icons.visibility,color: thirdColor,)),
                      ),
                      inputTextColor: thirdColor,
                      contorller: confirmPasswordController,
                      hintText: "Confirm New Password",
                      obscure: isVisible1,
                      borderRadius: BorderRadius.circular(12),
                      readOnly: false,
                      rightPadding: 20.0,
                      leftPadding: 20.0,
                      height: 70.5,
                      width: MediaQuery.of(context).size.width,
                      color: mainColor,
                      sidesColor: secondColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height:20 ,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                      padding: const EdgeInsets.only(left: 90,right: 90)
                    ),
                    onPressed: (){

                }, child: Text("Reset Password",style: TextStyle(
                  color: thirdColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
