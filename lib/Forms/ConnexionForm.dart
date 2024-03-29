import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:tp/Forms/TweetCreationForm.dart';
import 'package:tp/Home.dart';
import 'package:tp/Model/User.dart';
import 'package:tp/PomemonList.dart';
import 'package:tp/Providers/DesignProviders.dart';
import 'package:tp/Providers/Providers.dart';
import 'package:tp/Service/ApiCalls.dart';



class ConnextionForm extends StatelessWidget {

   ConnextionForm({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  TextFormField(
      
                    controller:  _textController,
                    decoration: InputDecoration(labelText: "email"),
                    validator: (String? value) {
                      if (!EmailValidator.validate(value!)) {
                        return "Votre email n'est pas valide";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Mot de passe"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SwitchWidget(),
                  FilledButton(
                    onPressed: () => onPressed(context),
                    child: const Text("Se connecter"),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {

    User user =  User("bellaire.dorian@gmail.com", "1234");

    ApiCalls().getTweets();

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
      builder: (BuildContext context) => Dialog(
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
                  Navigator.pushNamed(context, "/pokemons/list");

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




class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _Switch();
}

class _Switch extends State<SwitchWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: state,
      onChanged: (bool value) {
        setState(() {
          this.state = !state;
        });
      },
    );
  }
}
