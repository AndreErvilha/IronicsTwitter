import 'package:flutter/material.dart';
import 'package:ironic_tweets_andre_ervilha/screens/home_screen.dart';
import 'package:ironic_tweets_andre_ervilha/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('images/twitter_logo.png'),
                  SizedBox(height: 5),
                  Text('Ironic Tweets',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                      'from\n'
                      'André Ervilha',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12))
                ],
              ))
        ],
      ),
    );
  }
}
