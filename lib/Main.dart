import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Forms/ConnexionForm.dart';
import 'Forms/TweetCreationForm.dart';
import 'Home.dart';
import 'PomemonList.dart';
import 'Providers/DesignProviders.dart';
import 'Providers/Providers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TweetLoaderProvider()),
      ChangeNotifierProvider(create: (context) => PokemonLoaderProvider()),
      ChangeNotifierProvider(create: (context) => DropDownProvider()),
      ChangeNotifierProvider(create: (context) => DateProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/connexion" : (context) => ConnextionForm(),
        "/pokemons/list" : (context) => PokemonList(),
        "/tweet/add" : (context) => TweetCreationForm(),
        "/home" : (context) => Home(),

      },
      initialRoute: "/connexion",
    );
  }
}
