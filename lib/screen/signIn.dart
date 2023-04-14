import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:home_smart/screen/Home.dart';

import '../component/input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if(isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications() ;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('SignUp Screen'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        buildTextJost(
                          text: 'Sign In',
                          textColor: rgbBahgaPurple3,
                          textSize: 28,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        buildFormFieldText(
                          hintText: "email@smarthome.com",
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter a valid email ';
                            }
                            // if (!RegExp(patterns[1]['emailPattern'])
                            //     .hasMatch(value)) {
                            //   return '     email must be like email@type.com';
                            // }
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              value = emailController.text;
                            }
                          },
                          controller: emailController,
                          labelText: "Email",
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        buildFormFieldText(
                            hintText: "* * * * * * * *",
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter a correct password ';
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = passwordController.text;
                              }
                            },
                            controller: passwordController,
                            labelText: "Password",
                            prefixIcon: Icons.lock,
                            keyboardType: TextInputType.visiblePassword,
                            isSecure: isPassword,
                            suffix: isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            suffixPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            //           email: emailController.text;
                            //           password: passwordController.text ;
                            //     }
                          },
                          child: buildTextJost(
                              text: 'forget your password!',
                              textColor: rgbBahgaPurple3,
                              textSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //const SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                if(emailController.text.trim().toLowerCase().contains("amr@smarthome.com") &&
                                    passwordController.text.trim().toLowerCase().contains("12345") ){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  AttacksList()),(route) => true,
                                  );
                                }
                              }

                            },
                            child: Text("Sign In") ,

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
