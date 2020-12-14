import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ironic_tweets_andre_ervilha/blocs/home_bloc.dart';
import 'package:ironic_tweets_andre_ervilha/utils/colors.dart';
import 'package:ironic_tweets_andre_ervilha/widgets/twitter_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc bloc = HomeBloc();

  final twitter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ironics Tweets'),
          backgroundColor: primaryColor,
        ),
        drawer: buildDrawer(context),
        floatingActionButton: buildFloatingActionButton(context),
        backgroundColor: backgroundColor,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(controller: twitter),
              RaisedButton(
                onPressed: () {
                  bloc.getTweets();
                },
                color: primaryColor,
                child: Text('Listar Tweets',
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(child: buildTweetsList())
            ],
          ),
        ));
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.message),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Credits'),
                content: Text('Created by: André Ervilha\n'
                    'Date: Dec, 11/2020\n'
                    'Powered by: Flutter')));
      },
    );
  }

  Container buildDrawer(BuildContext context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width - 50,
      child: Center(
          child: Text('Drawer',
              style: TextStyle(color: Colors.white, fontSize: 20))),
    );
  }

  StreamBuilder buildTweetsList() => StreamBuilder(
        stream: bloc.tweets,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return buildCardMessage('Algo deu errado!');
          else if (!snapshot.hasData)
            return buildCardMessage('Clique no botão para pesquisar');
          else
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    twitterCard(snapshot.data[index]));
        },
      );

  Widget buildCardMessage(String message) => Align(
        alignment: Alignment.topCenter,
        child: Card(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                height: 50,
                child: Text(message))),
      );

  Widget buildTextField({TextEditingController controller}) {
    return Row(children: [
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'pesquisar por palavra',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      InkWell(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            child: Icon(Icons.search, size: 30),
          ),
          onTap: () {
            bloc.setFilter(twitter.text);
          })
    ]);
  }
}
