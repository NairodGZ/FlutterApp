import 'package:flutter/material.dart';

   void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // Empêche de fermer la boîte de dialogue en appuyant à l'extérieur
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(), // Indicateur de chargement
              SizedBox(height: 16.0),
              Text(message), // Message de chargement
            ],
          ),
        );
      },
    );
  }

   void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(); // Ferme la boîte de dialogue
  }

