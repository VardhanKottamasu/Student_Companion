import 'package:flutter/material.dart';
import '../Screens/tts.dart';
class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/3,
      child: Card(
        elevation: 10.0,
        child: GestureDetector(
          onTap:()=> Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Tts()
          ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/tts_bg.jpg',),
                  fit: BoxFit.contain
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Text('Text to Speech',textAlign:TextAlign.end,style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily:"Raleway"
            ),
            ),
          ),
        ),
      ),
    );
  }
}
