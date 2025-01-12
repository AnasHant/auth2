import 'package:flutter/material.dart';
import 'package:auth2/screens/auth/forgot_password.dart';
import 'package:auth2/screens/auth/sign_in.dart';


class AccForgetPassPage extends StatefulWidget {

  @override
  _AccForgPassPageState createState() => _AccForgPassPageState();
}

class _AccForgPassPageState extends State<AccForgetPassPage>{
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
  _usernameController.dispose();
  super.dispose();
  }

  void accLookup() {
    Navigator.pushReplacement(

      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
    );
  }

  @override
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
      child: Column(
        mainAxisSize: MainAxisSize.min ,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const SizedBox(height: 60), // Top space
                    // Sign In Title
                  const Text(
                    'Username or Email',
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your username or Email for your \naccount to reset the password',
                    textAlign: TextAlign.start,
                    //textDirection: textSize,
                    style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,

                    ),
                  ),
                  const SizedBox(height: 30),

                    // Username Input
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                    labelText: 'User Name or Email',
                    border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                    // check Button
                  ElevatedButton(
                    onPressed: accLookup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                  const SizedBox(height: 10),
                    ],
                )
            ),
          ),
        ],
      ),
    ),
  );
  }
}
