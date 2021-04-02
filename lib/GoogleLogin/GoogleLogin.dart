import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_food/home.dart';
import 'package:flutter_food/home_screen.dart';

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<User> _signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final User user = (await _auth.signInWithCredential(credential)).user;
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  //final User currentUser = await _auth.currentUser();
  final User currentUser = FirebaseAuth.instance.currentUser;
  assert(user.uid == currentUser.uid);
  return user;
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
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
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                loader: Container(
                  padding: EdgeInsets.all(10),
                  child: SpinKitRotatingCircle(
                    color: Colors.white,
                    // size: loaderWidth ,
                  ),
                ),
                onTap: (startLoading, stopLoading, btnState) {
                  _signInWithGoogle()
                      .then((User user) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                        //Do Whatver You Want like storing the user data in the DATABASE
                      })
                      .catchError((e) {
                    debugPrint(e.toString());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
