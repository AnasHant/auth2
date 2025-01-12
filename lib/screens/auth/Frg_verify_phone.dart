import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auth2/screens/auth/forgot_password.dart';
import 'package:auth2/screens/auth/reset_password.dart';


class FrgVerifyPhonePage extends StatefulWidget {
  @override
  _FrgVerfPhoneState createState() => _FrgVerfPhoneState();
}

class _FrgVerfPhoneState extends State<FrgVerifyPhonePage> {
  late Timer _timer;
  int _start = 60;
  bool _isDisabled = true;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          _isDisabled=false;
          setState(() {
            timer.cancel();
          });
        } else {
          _isDisabled=true;
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Verify using phone',
              style: TextStyle(

                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),


            const SizedBox(height: 8),
            Text(
              'Please enter the verification code we have sent to you by phone:',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            Form(

              child: Padding(
              padding: EdgeInsets.all(10.0) ,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          onSaved: (pin1){},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          //style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType. number,
                          textAlign: TextAlign. center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter (1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          onSaved: (pin2){},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          //style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType. number,
                          textAlign: TextAlign. center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter (1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          onSaved: (pin3){},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          //style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType. number,
                          textAlign: TextAlign. center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter (1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          onSaved: (pin4){},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          //style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType. number,
                          textAlign: TextAlign. center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter (1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ]
                )
            ),),
            const SizedBox(height: 20),
            Text('Resending a code after: 00:$_start'),
            ElevatedButton(
                onPressed: _isDisabled
                    ? null // Disable button when _isButtonDisabled is true
                    : () {
                  _start = 60;// Reset timer
                  startTimer(); // Restart the timer and disable button again
                },
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        color: _isDisabled ? Colors.grey : Colors.blue,
                      ),
                    ),
                  ),
            Expanded(child: Container()),
        SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(

                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ),

                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeBox() => Container(
    width: 40,
    height: 56,
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: Colors.black12)),
    ),
  );
}
