import 'package:flutter/material.dart';
import 'package:auth2/screens/auth/forgot_password.dart';

class ResetPasswordPage extends StatefulWidget {

  @override
  _RePassPageState createState() => _RePassPageState();
}
bool _isPasswordVisible = false;
bool _isCPasswordVisible = false;
class _RePassPageState extends State<ResetPasswordPage>{
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
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
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
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
                          'Create new password',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Your new password must be different \nfrom the previous  used passwords',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),

                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                const Text(
                                  '\tNew Password:',
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 20),
                                const Text(
                                  '\tconfirm Password:',
                                  textAlign: TextAlign.left,

                                ),
                                const SizedBox(height: 10),
                                TextFormField(

                                  controller: _confirmPasswordController,
                                  obscureText: !_isCPasswordVisible,
                                  decoration: InputDecoration(
                                    labelText: 'confirm Password',
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isCPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isCPasswordVisible = !_isCPasswordVisible;
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
                                const SizedBox(height: 20),

                                // Sign In Button
                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text('Confirm'),
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