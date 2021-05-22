import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:housytask/screens/housingfilter.dart';
import 'package:housytask/multipleChoice.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:housytask/radio_button.dart';
import 'package:housytask/screens/electricfilter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: P_Electrician(),
        ),
        ChangeNotifierProvider.value(
          value: P_Housing(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HousingFilter(),
      ),
    );
  }
}
