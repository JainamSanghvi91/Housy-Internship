import 'package:flutter/cupertino.dart';

class P_Tiffin with ChangeNotifier {
  Map<String, bool> item1 = {
    'Vegetarian': false,
    'Non-Vegetarian': false,
    'Veg and Non-veg': false,
  };

  void ans1(var list) {
    item1 = list;
  }

  Map<String, bool> item2 = {
    'Any': false,
    'North Indian': false,
    'South Indian': false,
    'Maharashtrian food': false,
    'Jain': false,
    'Continental food': false,
  };

  void ans2(var list) {
    item2 = list;
  }

  Map<String, bool> item3 = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
  };

  void ans3(var list) {
    item3 = list;
  }
}
