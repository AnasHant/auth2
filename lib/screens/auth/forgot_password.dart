import 'package:flutter/material.dart';
import 'package:auth2/screens/auth/sign_in.dart';
import 'package:auth2/screens/auth/reset_password.dart';
import 'package:auth2/screens/auth/Frg_verify_email.dart';
import 'package:auth2/screens/auth/Frg_verify_phone.dart';


class ForgotPasswordPage extends StatefulWidget {

  @override
  _ForgPassPageState createState() => _ForgPassPageState();
}
bool _isPasswordVisible = false;
bool _isCPasswordVisible = false;
class _ForgPassPageState extends State<ForgotPasswordPage>{
  //final TextEditingController _confirmPasswordController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    //_confirmPasswordController.dispose();
    //_passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Forgot Password",

            style:TextStyle(
              //fontFamily: 'Montserrat-Bold',
              fontSize: 20 ,
              color: Colors.blue,

            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left_rounded,
            ),
            iconSize: 45,
            onPressed: () {
              Navigator.pushReplacement(

                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child:
          Align(
              alignment: Alignment.centerLeft,
              child: Form(
                  child: Padding(
                    padding: EdgeInsets.all(10.0) ,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          const Text(
                            'Make Selection',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Select which contact detail should we\nuse to reset your password?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => FrgVerifyPhonePage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    minimumSize: const Size(double.infinity, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child:const Row(
                                    children: [
                                      Icon(
                                        size: 30,
                                        Icons.phone_in_talk,
                                        color: Colors.black54,

                                      ),
                                      SizedBox(width: 15,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'via phone number',
                                            style:TextStyle(
                                              fontSize: 17,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text( //phone number
                                            '+962 77*****81',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black38,

                                            ),
                                          ),
                                        ],

                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Sign In Button
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => FrgVerifyEmailPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    minimumSize: const Size(double.infinity, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child:Row(
                                    children: [
                                      Container(
                                        height:40,
                                        child: Icon(
                                            Icons.mail,
                                          size: 30,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'via Email',
                                            style:TextStyle(
                                              fontSize: 17,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text( //phone number
                                            'H***me@gmail.com',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black38,

                                            ),
                                          ),
                                        ],

                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          )
                        ]
                    ),
                  )
              )
          ),
        )
    );
  }
}