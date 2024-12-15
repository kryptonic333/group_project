import'package:flutter/material.dart';


class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Gamify App"), centerTitle: true,),
        body: const Center(
          child: Text(
          "-Welcome to Gamify App," 
          "-This app is made using the Flutter Framework."
          "-The programming language used for this app is Dart."
          "-The app is made using Flutter's Material Design, which is a responsive and easy-to-use design library for Flutter."
          ),
        ),
    );
  }
}