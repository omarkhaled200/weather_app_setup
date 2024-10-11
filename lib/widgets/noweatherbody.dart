import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('there is no Weather 😔 start',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
            Text('Searching now 🔍',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400),)
          ],
        ),
      );
  }
}