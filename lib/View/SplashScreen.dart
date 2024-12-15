import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:group_project/View/HomeScreen.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Homescreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 248, 229, 229),
            fontFamily: 'Pacifico',
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: true,
            animatedTexts: [
              
              TyperAnimatedText('Group Project',textStyle:const  TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 233, 182, 182),
                
              )),
            ],
            
          ),
        ),
      ),
    );
  }
}