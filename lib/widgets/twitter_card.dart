import 'package:flutter/material.dart';

Card twitterCard(Map data) {
  String name = data['user']['name'].toString();
  String user = data['user']['screen_name'].toString();
  String userPicture = data['user']['profile_image_url_https'].toString();
  String dataPicture;
  if(data['entities'].containsKey('media'))
    if(data['entities']['media'][0].containsKey('media_url_https'))
      dataPicture = data['entities']['media'][0]['media_url_https'];
  String tweet = data['text'].toString();
  String reTweets = data['retweet_count'].toString();
  String favorites = data['favorite_count'].toString();
  String datetime = data['created_at'].toString();

  return Card(
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    child: Container(
      constraints: BoxConstraints(maxHeight: 500, minWidth: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(userPicture, fit: BoxFit.cover)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('@$user', textAlign: TextAlign.start),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          dataPicture != null
              ?Container(height: 200, child: Image.network(dataPicture,fit: BoxFit.cover),)
              :Container(),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Text(tweet,
                  style: TextStyle(fontSize: 20), maxLines: 6, softWrap: true)),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(8),
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'RETWEETS',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        Text(
                          reTweets,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'FAVORITES',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        Text(
                          favorites,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(datetime),
            ),
          )
        ],
      ),
    ),
  );
}
