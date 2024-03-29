import 'package:flutter/material.dart';
import 'package:tp/Model/Tweet.dart';

import '../Model/Pokemon.dart';
import '../Service/ApiCalls.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

class TweetLoaderProvider with ChangeNotifier{

  bool isLoading = true;

  List<Tweet> _listTweet = [];

  List<Tweet> get listTweet => _listTweet;


  Future<void> refreshTweetList() async {
    _listTweet = await ApiCalls().getTweets();
    this.isLoading = false;
    notifyListeners();
  }
}

class PokemonLoaderProvider with ChangeNotifier
{

  PokemonLoaderProvider()
  {
    refreshPokemonList();
  }

  bool isLoading = true;

  List<Pokemon> _listPokemon = [];

  List<Pokemon> get listPokemon => _listPokemon;

  Future<void> refreshPokemonList() async
  {
    print("nefufuehfuheufhhuh");
    _listPokemon = await ApiCalls().getPokemons();
    this.isLoading = false;
    notifyListeners();
  }

}
