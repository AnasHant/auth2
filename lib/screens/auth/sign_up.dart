import 'package:flutter/material.dart';
import 'package:auth2/screens/auth/sign_in.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
bool _isPasswordVisible = false;

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for text input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // FormKey for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Simulated sign-up function
  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Get user input
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String phone = _phoneController.text.trim();
      String password = _passwordController.text.trim();

      // Placeholder sign-up logic (this should be replaced with API calls)
      print('Signing up user:');
      print('Name: $name');
      print('Email: $email');
      print('Phone: $phone');

      // Show success dialog or perform other actions
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign Up Successful'),
            content: Text('Welcome, $name!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  // Navigate to another screen if necessary
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Assign form key for validation
          child: Padding(
          padding: EdgeInsets.all(10.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50), // Top space
              // App Logo
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/en-logo.PNG',
                  height: 200,
                ),
              ),

              SizedBox(height: 30),
              // Sign Up Title
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Give us some information to get free access to Hear Me',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),

              // Name Input
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Email Input
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Your E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Phone Number Input
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Password Input
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
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
              SizedBox(height: 40),

              // Sign Up Button
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Sign In Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                      // Navigate to Sign In page
                    },
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              // Additional Sign-In Options (Google, Facebook, Apple)
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                'or continue with',
                textAlign: TextAlign.center,

              ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon:  SizedBox(
                      width: 60, // Desired width
                      height: 60, // Desired height
                      child: Image.asset('assets/images/google_logo.png'),
                    ),
                    onPressed: () {
                      // Handle Google sign-in
                    },
                  ),
                  IconButton(
                    icon: SizedBox(
                      width: 48, // Desired width
                      height: 48, // Desired height
                      child: Image.asset('assets/images/facebook_logo.png'),
                    ),
                    onPressed: () {
                      // Handle Facebook sign-in
                    },
                  ),
                  IconButton(
                    icon: SizedBox(
                      width: 48, // Desired width
                      height: 48, // Desired height
                      child: Image.asset('assets/images/apple_logo.png'),
                    ),
                    onPressed: () {
                      // Handle Apple sign-in
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
