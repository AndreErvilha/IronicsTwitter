import 'package:dio/dio.dart';

class Api {

  static const String bearer = "AAAAAAAAAAAAAAAAAAAAAOqLKgEAAAAAWr%2BD"
      "xzCTRNbRXtzLW%2FKstQUj7WY%3DL7gF67Vs1Ch"
      "vnu4TTp8TdWUtYMFBl6OX0XvLh1ilBIrPGjFLZ5";

  final dio = Dio();

  Api() {
    dio.options = BaseOptions(headers: {'Authorization': 'bearer $bearer'});
  }

  Future<List> getTweets(String user) async {
    Response response = await dio.get(
        'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=${user}&count=15');

    return response.data;
  }
}
