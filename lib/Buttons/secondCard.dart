import '../Screens/stt.dart';
import 'package:flutter/material.dart';
class SecondCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: GestureDetector(
        onTap:()=> Navigator.push(context, MaterialPageRoute(
            builder: (context)=>VoiceName()
        ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/stt_bg.jpg',),
                fit: BoxFit.fitWidth
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Text('Speech to Text',textAlign:TextAlign.end,style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily:"Raleway"
          ),
          ),
        ),
      ),
    );
  }
}
