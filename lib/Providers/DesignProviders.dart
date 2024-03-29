


import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:tp/Forms/TweetCreationForm.dart';

class DropDownProvider with ChangeNotifier
{


      String _selectedIitem = items.first;

    String get selectedItem => _selectedIitem;

    void setSelectedItem(String selected)
    {
      this._selectedIitem = selected;
      notifyListeners();
    }


}

class DateProvider with ChangeNotifier
{

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedItem(DateTime selected)
  {
    this._selectedDate = selected;
    notifyListeners();
  }

}