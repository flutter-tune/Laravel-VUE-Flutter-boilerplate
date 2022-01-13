import 'dart:async';
import 'package:app/helper/auth.dart';
import 'package:app/screen/home/home_screen.dart';
import 'package:app/screen/signin/signin_screen.dart';
import 'package:app/screen/splash/SplashScreen.dart';
import 'package:app/utilities/routes.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isLoggedIn = await localIsLoggedIn();
  runApp(MyApp(isLoggedIn));
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;

  const MyApp(this.isLoggedIn);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(milliseconds: 1200)),
      builder: (context, AsyncSnapshot snapshot) {
        return MaterialApp(
          title: 'Instant Salaries',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
          ),
          home: snapshot.connectionState == ConnectionState.waiting
              ? SplashScreen()
              : widget.isLoggedIn
                  ? HomeScreen()
                  : SigninScreen(),
          routes: routes,
        );
      },
    );
  }
}
