import 'package:flutter/material.dart';
import 'package:auth2/screens/auth/sign_up.dart';
import 'package:auth2/screens/auth/forgot_password.dart';
import 'package:auth2/screens/auth/acc_forget_pass.dart';
import '/screens/home/home_page.dart';
import '/screens/onboarding/welcome_page.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isRememberMeChecked = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      // Simulated sign-in logic (replace with your backend logic)
      //print('Signing in with username: $username');

      // Placeholder for authentication logic
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
      // You can navigate to another screen after successful sign-in
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.min ,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Top space
                  // Logo
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/en-logo.PNG',
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign In Title
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome to Hear Me! \nEmpowering healthcare communication –\ntranslating your signs into text for a seamless medical experience.',
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
                      labelText: 'User Name',
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

                  // Password Input
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  AccForgetPassPage()),
                      );
                      // Handle "Forgot Password"
                    },
                    child: const Text(
                      'Forgot your password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,

                        color: Colors.blue,


                      ),
                    ),
                  ),
                  const SizedBox(height: 10),


                  // Remember Me Checkbox
                  Row(
                    children: [
                      Checkbox(

                        value: _isRememberMeChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isRememberMeChecked = value ?? false;
                          });
                        },
                      ),
                      const Text('Remember me'),

                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text('Log In'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),


                  ),
                  const SizedBox(height: 10),

                  // Sign Up & Forgot Password Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          'New User? ',
                        style: TextStyle(
                          fontSize: 14
                        ),

                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                          // Navigate to Sign Up page
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue
                          ),
                        ),
                      ),
                      const Spacer(),

                    ],
                  ),
                  const SizedBox(height: 20),

                  // Social Media Login Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    const Text('or'),
                    const SizedBox(height: 10),
                    const Text(
                      'Log In with your Account via Social Media',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),

                  // Social Media Buttons (Facebook, Google)

                    ElevatedButton(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      child: const Text('Facebook' ,style: TextStyle(fontSize: 25),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(230, 75),
                      ),
                    ),
                    const SizedBox(height: 10), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle Google login
                      },
                      child: const Text('Google' ,style: TextStyle(fontSize: 25)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white  ,
                        minimumSize: const Size(230, 75),
                      ),
                    ),
                    ],
                  ),
                ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
