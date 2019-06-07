// import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saico_quotes/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // if (Platform.isAndroid || true) {
      return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.white),
            )),
        home: Scaffold(
          body: QuoteApp(),
        ),
      );
    // } else {
    //   return CupertinoApp(
    //     home: CupertinoPageScaffold(
    //       child: QuoteApp(),
    //     ),
    //   );
    }
  }
}
