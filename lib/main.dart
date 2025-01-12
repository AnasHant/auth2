import 'package:flutter/material.dart';
import 'screens/auth/sign_in.dart';
import 'screens/home/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

double Width = 0;
double Height = 0;

void main() async{
  // supabase setup
  await Supabase.initialize(
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRtaW5ienl3cG50ZmViaWF2emFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1NjE5ODQsImV4cCI6MjA1MjEzNzk4NH0.rA5_EQjUYSIloMUxCIi9wNfwqBUnsOVnoM0WRMfca-o' ,
    url: 'https://tminbzywpntfebiavzac.supabase.co',



  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Width = MediaQuery.of(context).size.width;
    Height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deaf Community App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage(),
      //initialRoute: '/home',

      routes: {
        //'/welcome': (context) => WelcomePage(),
        //'/sign_in': (context) => SignInScreen(),
        '/home': (context) => HomePage(),
        // Add other routes for screens here
      },
    );
  }
}
