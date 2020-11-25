import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Authentication/SplashScreenz.dart';
import 'package:e_shop/Counters/ItemQuantity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'Counters/cartitemcounter.dart';
import 'Counters/changeAddresss.dart';
import 'Counters/totalMoney.dart';
import 'Store/storehome.dart';









Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();


  EcommerceApp.auth = FirebaseAuth.instance;

  EcommerceApp.sharedPreferences = await SharedPreferences.getInstance();

  EcommerceApp.firestore = Firestore.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (c)=> CartItemCounter()),
      ChangeNotifierProvider(create: (c)=> ItemQuantity()),

      ChangeNotifierProvider(create: (c)=> AddressChanger()),

      ChangeNotifierProvider(create: (c)=> TotalAmount()),

    ],

      child:     MaterialApp(
          title: 'easymart2',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green,
          ),
          home: SplashScreenz()
      ),




    );
  }
}







class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    displaySplash();


  }

  displaySplash(){

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


  @override
  Widget build(BuildContext context)




  {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/admin.png'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: .98,
                      child:  Image.asset('images/gg.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'POWERED FOR YOU by '),
                          TextSpan(
                              text: 'HosamCo',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






/*

  {
    return Material(
      child: Container (
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [ Colors.pink , Colors.lightGreenAccent ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0 , 1.0],
            tileMode: TileMode.clamp,

          )
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("images/cash.png"),

              SizedBox(height: 20.0,),
              Text(

                " HuSSaM way of shopping",
                    style: TextStyle(color: Colors.white),
              ),

            ],
          ) ,
        ),
      )
    );
  }
}

*/