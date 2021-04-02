import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/GoogleLogin/GoogleLogin.dart';
import 'package:flutter_food/PhoneVerification/Phone.dart';
// import 'package:sinup/SignIn/SignIn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
// import 'SignUp/SignUp.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
          ArgonButton(
            height: 50,
            width: 300,
            borderRadius: 5.0,
            color: Colors.red,
            child: Text(
            "SignIn with Google",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            ),

            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.white,
                // size: loaderWidth ,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoogleLogin()));
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          ArgonButton(
            height: 50,
            width: 350,
            borderRadius: 5.0,
            color: Colors.green,
            child: Text(
              "Phone Verification",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.white,
                // size: loaderWidth ,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Phone()));
            },
          ),
      ],
    ),
        ));
  }
}
