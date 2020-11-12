import 'package:Pool/viewModels/signUpViewModel.dart';
import 'package:Pool/viewModels/validateLogin.dart';
import 'package:Pool/screens/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ValidateLoginModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: OnBoarding(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
