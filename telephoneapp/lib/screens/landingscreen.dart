import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget
{
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
  return Scaffold(
        appBar: AppBar(
                       title: const Text("Telephone Directory"),
                       backgroundColor: Colors.orange,
                       centerTitle: true,
                      ),
         body: const Center(
          child: Text("Telephone Directory ",style: TextStyle(color: Colors.orange),),
         ),
      );
  }

}