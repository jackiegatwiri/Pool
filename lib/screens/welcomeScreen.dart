import 'package:Pool/screens/loginScreen.dart';
import 'package:Pool/screens/signUpScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 10),
              child: Image.asset("assets/illustration2.png"),
            ),
            Text("Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "App that allows you to shop multiple products from different stores in one mall",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 20, 20, 50),
              child: Center(
                child: Row(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120.0,
                      height: 40.0,
                      child: RaisedButton(
                        elevation: 5,
                        animationDuration: Duration(seconds: 20),
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ButtonTheme(
                      minWidth: 120.0,
                      height: 40.0,
                      child: RaisedButton(
                        splashColor: Colors.green,
                        animationDuration: Duration(seconds: 20),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Or via social media",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/fb.png",
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/google.png",
                  width: 30.0,
                  height: 30.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
