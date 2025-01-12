import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:auth2/screens/home/home_page.dart';
class SoonAPage extends StatefulWidget {
  const SoonAPage({super.key});
  @override
  SoonAPageState createState() => SoonAPageState();
}

class SoonAPageState extends State<SoonAPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        leading: IconButton( //back to acc lockup
          icon: const Icon(
            Icons.chevron_left_rounded,
          ),
          iconSize: 45,
          onPressed: () {
            Navigator.pushReplacement(

              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Lottie.asset(
                'assets/animations/soooon.json',
                fit: BoxFit.contain,
                width: 250,
                height: 250,
                //repeat: true,

              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30,5,30,5),
              decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  )
              ),
              child:  const Text(
                'SOON',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}

