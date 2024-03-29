import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp/Forms/ConnexionForm.dart';
import 'package:tp/Providers/Providers.dart';
import 'package:tp/Service/ApiCalls.dart';

import 'Model/Tweet.dart';

class Home extends StatelessWidget {

  Home({super.key});



  @override
  Widget build(BuildContext context) {

    context.read<TweetLoaderProvider>().refreshTweetList();
    final listTweet =  context.watch<TweetLoaderProvider>().listTweet;

    if(context.read<TweetLoaderProvider>().isLoading)
      {
        return Scaffold(
          appBar: AppBar(title: Text("Twitter")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Étire la colonne sur toute la largeur de l'écran
            children: [
              Header(),
              Expanded( // Utilise un Expanded pour permettre à la deuxième colonne de remplir l'espace restant
                child: Center( // Centre verticalement le contenu
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Footer(),
        );
      }

    return Scaffold(
      appBar: AppBar(title: Text("Twitter")),
      body: Column(
        children: [
          Header( ),
          if(listTweet != null)
          Expanded(
              child: ListView.builder(
            itemCount: listTweet.length,
            itemBuilder: (BuildContext context, int index) {
              return PostCell(
                  title: listTweet[index].author,
                  description: listTweet[index].message);
            },
          )),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Nouveau",
            textAlign: TextAlign.left,
          )),
          Expanded(
              child: Text(
            "Acceuil",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            "Rechercher",
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {


  const Header({

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Row(
        children: [
          Expanded(
              child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/tweet/add");
            },
          )),
          Expanded(
              child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, "/pokemons/list");
            },
          )),
          Expanded(
              child: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => context.read<TweetLoaderProvider>().refreshTweetList()),
          )
        ],
      ),
    );
  }
}

class PostCell extends StatelessWidget {
  final String title;
  final String description;

  const PostCell({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK2nG24AYDm6FOEC7jIfgubO96GbRso2Xshu1f8abSYQ&s"),
        Column(
          children: [Text(title), Text(description)],
        )
      ],
    );
  }
}
