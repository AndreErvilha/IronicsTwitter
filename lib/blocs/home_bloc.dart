import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:ironic_tweets_andre_ervilha/api/api.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase{

  final _api = Api();

  BehaviorSubject<List> _tweets = BehaviorSubject<List>();
  Stream<List> get tweets => _tweets.stream;

  Future<void> getTweets()async{
    _tweets.sink.add(null);
    print('getTweets');
    _tweets.sink.add(await _api.getTweets());
  }

  Future<void> setFilter(String text)async{
    print('setFilter');
    List result = await _api.getTweets();
    _tweets.sink.add(result.where((element) => element['text'].toString().contains(text)).toList());
  }

  @override
  void dispose() {
    super.dispose();

    _tweets.close();
  }
}