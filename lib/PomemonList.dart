import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tp/Forms/ConnexionForm.dart';
import 'package:tp/Providers/Providers.dart';
import 'package:tp/Service/ApiCalls.dart';
import 'Utils/LoadingDialog.dart';
import 'Model/Pokemon.dart';
import 'Model/Tweet.dart';




class PokemonList extends StatelessWidget {

  PokemonList({super.key});



  @override
  Widget build(BuildContext context) {

    final provider = context.watch<PokemonLoaderProvider>();

    final listPokemon =  provider.listPokemon;

    if (provider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Pokemon")),
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
          Header(),
          // ConnextionForm(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                print(boxConstraints.constrainWidth());

                switch(boxConstraints.constrainWidth())
                {
                  case < 806 :
                    return PokemonGridView(listPokemon: listPokemon, columnCount: 2,);

                  default :
                    return PokemonGridView(listPokemon: listPokemon, columnCount: 6,);
                }

              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({
    required this.columnCount,
    super.key,
    required this.listPokemon,
  });

  final int columnCount;

  final List<Pokemon> listPokemon;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount, // Nombre de colonnes dans la grille
        crossAxisSpacing: 1, // Espace horizontal entre les widgets
        mainAxisSpacing: 1, // Espace vertical entre les widgets
        childAspectRatio: 1, // Ratio de largeur/hauteur des widgets enfants
      ),
      itemCount: listPokemon.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCell(
          title: listPokemon[index].id.toString(),
          description: listPokemon[index].name,
          image: listPokemon[index].image,
        );
      },
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
            onPressed: () {},
          )),
          Expanded(
              child: Text(
            "Acceuil",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => context.read<PokemonLoaderProvider>().refreshPokemonList(),
          ))
        ],
      ),
    );
  }
}

class PostCell extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PostCell(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Image.network(this.image, fit: BoxFit.cover ,),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [Text(title), Text(description)],
          ),
        )
      ],
    );
  }
}
