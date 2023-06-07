

import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome To Chat App'),
      ),
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              width: mq.width * .5,
              left: mq.width * .25,
              child: Image.asset('assets/images/livechat.png')),

          //Google Login Button
          Positioned(
            bottom: mq.height * .15,
            width: mq.width * .9,
            left: mq.width * .05,
            height: mq.height * .07,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 159, 174, 214),
                  shape: const StadiumBorder(),
                  elevation: 1),
              onPressed: () {
                _handleGoogleButtonClick();
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: mq.height * .05,
              ),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(text: ' Login in with '),
                    TextSpan(
                        text: 'Google',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ],
                ),
              ),
            ),
          ),

          //Facebook Login Button
          Positioned(
            top: mq.height * .78,
            width: mq.width * .9,
            left: mq.width * .05,
            height: mq.height * .07,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  elevation: 1),
              onPressed: () {},
              icon: Image.asset(
                'assets/images/facebook.png',
                height: mq.height * .05,
              ),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(text: ' Sign in with '),
                    TextSpan(
                        text: 'Facebook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _handleGoogleButtonClick() {
    _signInWithGoogle().then((user) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
