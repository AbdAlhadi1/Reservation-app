import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/Login/Widget/Send%20Login%20Data.dart';
import 'package:reservationapp/my_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool formValidate() {
    var op = formKey.currentState;
    return op!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spacee,
                children: [
                  const SizedBox(
                    height: 280,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          MyFild(
                            contorller: emailController,
                            hintText: "email",
                            obscure: false,
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            color: Colors.white,
                            sidesColor: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            height: 65.0,
                            width: MediaQuery.of(context).size.width,
                            val: (_) {
                              if (emailController.text.isEmpty) {
                                return "required";
                              } else {
                                if (!EmailValidator.validate(
                                    emailController.text)) {
                                  return "please enter correct email";
                                } else {
                                  return "";
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MyFild(
                            contorller: passwordController,
                            hintText: "Password",
                            obscure: false,
                            readOnly: false,
                            rightPadding: 20.0,
                            leftPadding: 20.0,
                            color: Colors.white,
                            sidesColor: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            height: 65.0,
                            width: MediaQuery.of(context).size.width,
                            val: (_) {
                              if (passwordController.text.isEmpty) {
                                return "required";
                              } else {
                                if (passwordController.text.length < 8) {
                                  return "the password have to contain at least 8 character";
                                } else {
                                  return "";
                                }
                              }
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forget password",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Text(
                          "                                                ")
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(formValidate()){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendLoginData(emailController: emailController, passwordController: passwordController)));
                        }
                      },
                      child: const Text("LogIn")),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      InkWell(
                        onTap: () {
              
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 15,
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
