import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp/Model/Pokemon.dart';
import 'package:tp/Model/Tweet.dart';

class ApiCalls
{

Future<List<Tweet>> getTweets() async
{

  var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));

  List<dynamic> decodedJson = json.decode(response.body) ;
  
  List<Tweet> listTweet = decodedJson.map((tweetJson) => Tweet.fromJson(tweetJson)).toList();

  return listTweet;
}

Future<List<Pokemon>> getPokemons() async
{

  var response = await http.get(Uri.parse("https://pokebuildapi.fr/api/v1/pokemon/limit/20"));

  await Future.delayed(Duration(seconds : 2));

  List<dynamic> decodedJson = json.decode(response.body) ;

  List<Pokemon> listPokemon = decodedJson.map((pokemonJson) => Pokemon.fromJson(pokemonJson)).toList();

  return listPokemon;
}



}