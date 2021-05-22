import 'package:flutter/cupertino.dart';

class P_Housing with ChangeNotifier {
  List item1 = [
    "Part time",
    'Full time(non-live in)',
    'Full time(live in)',
  ];

  int currentselected = -1;

  void ans1(int id) {
    currentselected = id;
  }

  List item2 = [
    "1 Bedroom",
    '2 Bedrooms',
    '3 Bedrooms',
    '4 Bedrooms',
    '5 Bedrooms',
    '6 Bedrooms',
  ];

  List item3 = [
    "1 Bathroom",
    '2 Bathrooms',
    '3 Bathrooms',
    '4 Bathrooms',
    '5 Bathrooms',
  ];

  List item4 = [
    "Standard Cleaning",
    'Deep Cleaning',
    'Move out cleaning',
  ];

  Map<String, bool> item5 = {
    'Window cleaning': false,
    'fridge cleaning': false,
    'oven cleaning': false,
    'laundry cleaning': false,
  };

  List item6 = [
    "Just once",
    'Every week',
    'Every two weeks',
    'once a month',
  ];

  Map<String, bool> item9 = {
    'Early Morning': false,
    'Morning': false,
    'Afternoon': false,
    'Evening': false,
  };

  void ans9(var val) {
    item9 = val;
  }
}
