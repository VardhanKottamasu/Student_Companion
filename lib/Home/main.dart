import 'file:///C:/Users/Vardhan%20Kottamasu/AndroidStudioProjects/firebaseconfig/lib/Buttons/firstCard.dart';
import 'file:///C:/Users/Vardhan%20Kottamasu/AndroidStudioProjects/firebaseconfig/lib/Buttons/secondCard.dart';
import 'file:///C:/Users/Vardhan%20Kottamasu/AndroidStudioProjects/firebaseconfig/lib/Buttons/thirdCard.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  home: MyApp(),
  color: Colors.purpleAccent,
  title: 'Student Companion',
  debugShowCheckedModeBanner: false,)
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(backgroundColor: Colors.deepPurple, title: Text('Student Companion'),),
            body: AppPage()
          );
  }
}
class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0 ),
          child: Column(
            children: <Widget>[
              FirstCard(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/3,
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: SecondCard(),
                    ),
                    Expanded(
                      child: ThirdCard()
                    ),
                  ],
                ) ,
              ),
              Image.asset('assets/bg.jpg')
            ],
          ),
        ),
      ),
    );
  }
}

