
import 'dart:async';

import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:flutter/material.dart';

import 'authenication.dart';

class SplashScreenz extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenz>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {

    //  displaySplash();


      navigationPage();
    });




  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }




  /*
  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
  }
*/
  Widget build(BuildContext context) {
    return Material(
  /*      child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/gg.jpg'), fit: BoxFit.cover)),*/
      child: Container(
        decoration: BoxDecoration(color: Colors.lightGreenAccent),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child:  Image.asset('images/gg.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'Spalsh Screenz',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    )

    ;
  }

  navigationPage(){

    Timer(Duration(seconds: 6) , () async{


      if( await EcommerceApp.auth.currentUser() != null) {


        Route route = MaterialPageRoute(builder: (_)=> StoreHome());
        Navigator.pushReplacement(context, route);


      }

      else
      {
        Route route = MaterialPageRoute(builder: (_)=> AuthenticScreen());
        Navigator.pushReplacement(context, route);


      }



    });



  }


}
