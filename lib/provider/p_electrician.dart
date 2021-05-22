import 'package:flutter/cupertino.dart';

class P_Electrician with ChangeNotifier {
  Map<String, bool> type_of_work = {
    'Installation': false,
    'Repair': false,
  };

  void c_type_of_work(var list) {
    type_of_work = list;
  }
}
