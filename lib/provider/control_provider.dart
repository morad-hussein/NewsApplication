import 'package:apiapi/view/screens/berkingnews_screen.dart';
import 'package:apiapi/view/screens/search_screen.dart';
import 'package:apiapi/view/screens/sports_screen.dart';
import 'package:flutter/material.dart';



class ControlProvider extends ChangeNotifier {

  int currentIndex=0;
  Widget CurrentScreen = BreakingNewsScreen() ;
  void changeScreen (int index){
    currentIndex=index;
    switch(index){
      case 0:
        {
          CurrentScreen = BreakingNewsScreen();
          break;
        }
          case 1:
        {
          CurrentScreen = SportsScreen();
          break;
        }
          case 2:
        {
          CurrentScreen = SearchScreen();
          break;
        }
    }
    notifyListeners();
  }


}



