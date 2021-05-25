import 'package:flutter/cupertino.dart';

class P_Electrician with ChangeNotifier {
  Map<String, bool> type_of_work = {
    'Installation': false,
    'Repair': false,
  };
  bool val=false;

  void changeval(){
    val=!val;
  }

  bool isdisable = true;
  String instruction="";
  Map<String, bool> services = {
    'Complete Wiring': false,
    'Switches': false,
    'Water Motor': false,
    'MCB & fuse': false,
    'Fans and Lights': false,
  };

  Map<String, bool> time = {
    'Early morning': false,
    'morning': false,
    'afternoon': false,
    'evening': false,
  };

  List height_ceiling = [
    'under 8 feet',
    '8-10 feet',
    '10-14 feet',
    'over 14 feet'
  ];

  List service_place=[
    'Home',
    'office',
    'others'
  ];

  DateTime date;

  int currentheight = -1;

  String current_service_place="";

  void c_service_place(String ser){
    current_service_place=ser;
  }

  void c_height(int id) {
    currentheight = id;
  }

  void c_type_of_work(var list) {
    type_of_work = list;
    // changeisdisable(list);
  }

  void c_services(var list) {
    services = list;
    // changeisdisable(list);
  }

  void c_time(var list){
    time=list;
  }

  void c_date(DateTime date2){
    date=date2;
  }
}
