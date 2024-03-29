

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp/Providers/DesignProviders.dart';

class TweetCreationForm extends StatelessWidget {
  TweetCreationForm({
    super.key,
  });



  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Twitter")),
        body: Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Nom de l'auteur"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                  DropDown(),
                  DateSelection(),
                  SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: () => onPressed(context),
                    child: const Text("Créer"),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    //
    // User user =  User("bellaire.dorian@gmail.com", "1234");
    //
    // ApiCalls().getTweets();

    // if(user.email ==  "" /*this._textController.text*/)
    //   {
    displaySuccessDialog(context);
    // }

    // if (this.formKey.currentState?.validate() == true) {
    //   displaySuccessDialog();
    // }
  }

  void displaySuccessDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Connexion réussie'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/home");
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

const List<String> items = ["Politique", "International", "Sport", "Culture"];

class DropDown extends StatelessWidget {
   DropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(
        value: context.watch<DropDownProvider>().selectedItem ,
        items: items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList(),
        onChanged: (value) => {
          context.read<DropDownProvider>().setSelectedItem(value!),
    }
    );
  }
}

class DateSelection extends StatelessWidget{

  DateSelection({
    super.key});


  Future<void> _selectDate(BuildContext context, DateTime date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != date) {
     context.read<DateProvider>().setSelectedItem(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = context.watch<DateProvider>().selectedDate;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "${selectedDate.toLocal()}".split(' ')[0],
          style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () => _selectDate(context, selectedDate),
          child: const Text('Select date'),
        ),
      ],
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
        ],
      ),
    );
  }
}
