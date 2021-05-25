import 'package:flutter/cupertino.dart';

class P_Massage with ChangeNotifier {
  List item1 = [
    "1 Person",
    '2 People',
  ];

  int currentans1 = -1;

  void ans1(int id) {
    currentans1 = id;
  }

  List item2 = [
    "50 minutes session",
    '90 minutes session',
  ];

  int currentans2 = -1;

  void ans2(int id) {
    currentans2 = id;
  }

  List item3 = [
    'Swedish massage',
    'deep tissue',
    'Thai massage',
    'sports',
    'medical massage',
  ];

  int currentans3 = -1;

  void ans3(int id) {
    currentans3 = id;
  }

  List item4 = [
    'No gender preference',
    'Female',
    'Male',
  ];

  int currentans4 = -1;

  void ans4(int id) {
    currentans4 = id;
  }

  String additional = "";
  void ans5(String ans) {
    print(ans);
    print("This function is been called");
    additional = ans;
  }

  Map<String, bool> item6 = {
    'Early Morning': false,
    'Morning': false,
    'Afternoon': false,
    'Evening': false,
  };

  void ans6(var val) {
    item6 = val;
  }

  DateTime date = DateTime.now();

  void ans7(DateTime date2) {
    date = date2;
  }
  bool isfirst=true;

  void changefirst(){
    isfirst=false;
  }
}
