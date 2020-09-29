import 'package:Pool/widgets/navigationDrawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  NavigationDrawer();
                },
                child: Icon(Icons.menu)),
            Text("Choose Vendor"),
            Icon(Icons.shopping_cart)
          ],
        ),
      ),
    );
  }
}
