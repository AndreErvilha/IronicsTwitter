import 'package:flutter/material.dart';
import 'package:ironic_tweets_andre_ervilha/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ironics Tweets'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: backgroundColor,
      body: Container()
    );
  }
}