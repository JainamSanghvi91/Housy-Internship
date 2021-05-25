import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housytask/grid.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:housytask/screens/PersonListpage.dart';
import 'package:housytask/provider/p_massage.dart';
import 'package:housytask/provider/p_tiffin.dart';
import 'package:housytask/screens/authScreen.dart';
import 'package:housytask/screens/emailAuth.dart';
import 'package:housytask/screens/googleSignIn.dart';
import 'package:housytask/screens/homepage.dart';
import 'package:housytask/screens/housingfilter.dart';
import 'package:housytask/multipleChoice.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:housytask/radio_button.dart';
import 'package:housytask/screens/electricfilter.dart';
import 'package:housytask/screens/massagefilter.dart';
import 'package:housytask/screens/splashScreen.dart';
import 'package:housytask/screens/tiffinfilter.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        ChangeNotifierProvider.value(
          value: P_Tiffin(),
        ),
        ChangeNotifierProvider.value(
          value: P_Massage(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ChangeNotifierProvider(
          create: (contex) => GoogleSingnInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, userSnapshot) {
              final provider = Provider.of<GoogleSingnInProvider>(context);
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return SplasScreen();
              } else if (provider.isSigningIn) {
                return SplasScreen();
              } else if (userSnapshot.hasData) {
                return HomePage();
              }
              return AuthScreen();
            },
          ),
        ),
        routes: {
          HousingFilter.routename: (ctx) => HousingFilter(),
          ElectriFilter.routename: (ctx) => ElectriFilter(),
          MassageFilter.routename: (ctx) => MassageFilter(),
          TiffinFilter.routename: (ctx) => TiffinFilter(),
          EmailAuth.routename: (ctx) => EmailAuth(),
        },
      ),
    );
  }
}
