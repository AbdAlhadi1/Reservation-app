import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservationapp/Forget%20Password/Screen/Reset%20Password%20Page.dart';
import 'package:reservationapp/Forget%20Password/Widget/Send%20Verification%20Code%20For%20Forget%20Password.dart';


// ignore: must_be_immutable
class CodeVerificationForForgetPasswordPage extends StatefulWidget {
   TextEditingController emailController;
   CodeVerificationForForgetPasswordPage({
     required this.emailController,
     super.key,
  });
  @override
  State<StatefulWidget> createState() => _CodeVerificationForForgetPasswordPage();

}

class _CodeVerificationForForgetPasswordPage extends State<CodeVerificationForForgetPasswordPage> {
  final _focusNode = FocusNode();
  String code = "";
  TextEditingController firstDigit = TextEditingController();
  TextEditingController secondDigit = TextEditingController();
  TextEditingController thirdDigit = TextEditingController();
  TextEditingController fourthDigit = TextEditingController();
  TextEditingController fifthDigit = TextEditingController();
  TextEditingController sixthDigit = TextEditingController();
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter Verification Code",style: TextStyle(
                  color: thirdColor,
                  fontSize: 26,
                ),),
                const SizedBox(height: 8,),
                // ignore: prefer_interpolation_to_compose_strings
                Text("verification code has been sent to his email :",style: TextStyle(
                    color: thirdColor,
                  fontSize: 16
                ),),
                Text(widget.emailController.text,style: TextStyle(fontSize: 16,color: thirdColor),),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                              color: thirdColor
                            ),
                            focusNode: _focusNode,
                            autofocus: true,
                            controller: firstDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                                color: thirdColor
                            ),
                            controller: secondDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                                color: thirdColor
                            ),
                            controller: thirdDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                                color: thirdColor
                            ),
                            controller: fourthDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                                color: thirdColor
                            ),
                            controller: fifthDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 45,
                          child: TextFormField(
                            style: TextStyle(
                                color: thirdColor
                            ),
                            controller: sixthDigit,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:35,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondColor,
                    padding: const EdgeInsets.only(left: 100,right: 100)
                  ),
                  onPressed: (){
                    code = firstDigit.text.toString()+secondDigit.text.toString()+thirdDigit.text.toString()+fourthDigit.text.toString()+fifthDigit.text.toString()+sixthDigit.text.toString();
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResetPasswordPage(emailController: widget.emailController,)));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendVerificationCodeForForgetPassword(code: code, emailController: widget.emailController)));
                  },
                  child:Text("Send" , style: TextStyle(
                    color: thirdColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),),
                ),
                const SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Did not get the Code ?",style: TextStyle(
                          color: thirdColor
                      ),),
                      InkWell(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResendEmailCode(email: widget.email)));
                        },
                        child: Text("Resend Code",style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
