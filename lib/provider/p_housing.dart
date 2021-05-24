import 'package:flutter/cupertino.dart';

class P_Housing with ChangeNotifier {
  List item1 = [
    "Part time",
    'Full time(non-live in)',
    'Full time(live in)',
  ];

  int currentans1 = -1;

  void ans1(int id) {
    currentans1 = id;
  }

  List item2 = [
    "1 Bedroom",
    '2 Bedrooms',
    '3 Bedrooms',
    '4 Bedrooms',
    '5 Bedrooms',
    '6 Bedrooms',
  ];

  int currentans2 = -1;

  void ans2(int id) {
    currentans2 = id;
  }

  List item3 = [
    "1 Bathroom",
    '2 Bathrooms',
    '3 Bathrooms',
    '4 Bathrooms',
    '5 Bathrooms',
  ];

  int currentans3 = -1;

  void ans3(int id) {
    currentans3 = id;
  }

  List item4 = [
    "Standard Cleaning",
    'Deep Cleaning',
    'Move out cleaning',
  ];

  int currentans4 = -1;

  void ans4(int id) {
    currentans4 = id;
  }

  Map<String, bool> item5 = {
    'Window cleaning': false,
    'fridge cleaning': false,
    'oven cleaning': false,
    'laundry cleaning': false,
  };

  void ans5(var list) {
    item5 = list;
  }

  List item6 = [
    "Just once",
    'Every week',
    'Every two weeks',
    'once a month',
  ];

  int currentans6 = -1;

  void ans6(int id) {
    currentans6 = id;
  }

  String additional = "";
  void ans7(String ans) {
    print(ans);
    print("This function is been called");
    additional = ans;
  }

  DateTime date = DateTime.now();

  void ans8(DateTime date) {
    date = date;
  }

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
