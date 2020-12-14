import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:ironic_tweets_andre_ervilha/api/api.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase{

  final _api = Api();

  BehaviorSubject<List> _tweets = BehaviorSubject<List>();
  Stream<List> get tweets => _tweets.stream;

  Future<void> getTweets(String user)async{
    _tweets.sink.add(await _api.getTweets(user));
  }

  @override
  void dispose() {
    super.dispose();

    _tweets.close();
  }
}