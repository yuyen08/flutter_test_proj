import 'package:carolinaproj/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
    /*MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/third': (context) =>  RandomWords(),
      },
    ),*/
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Carolina Cleaners",
      home: Home()
    );
  }

}
