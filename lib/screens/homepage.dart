import 'package:flutter/material.dart';
import 'package:housytask/screens/electricfilter.dart';
import 'package:housytask/screens/housingfilter.dart';
import 'package:housytask/screens/massagefilter.dart';
import 'package:housytask/screens/tiffinfilter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  bool _isloading = false;

  List images = [
    "assets/images/home-service_1.jpg",
    "assets/images/electric-service_1.jpg",
    "assets/images/massage-service_3.jpg",
    "assets/images/tiffin-service_1.jpg",
  ];

  List name = [
    "Housing Services",
    "Electrician Services",
    "Massage Services",
    "Tiffin Services",
  ];

  void page(int i) {
    if (i == 0) {
      Navigator.of(context).pushNamed(HousingFilter.routename);
    } else if (i == 1) {
      Navigator.of(context).pushNamed(ElectriFilter.routename);
    } else if (i == 2) {
      Navigator.of(context).pushNamed(MassageFilter.routename);
    } else {
      Navigator.of(context).pushNamed(TiffinFilter.routename);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxW = constraints.maxWidth;
        var maxH = constraints.maxHeight;
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 0.5 * maxH,
                    width: maxW,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Background_2.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 0.13 * maxH, left: 0.05 * maxW),
                      color: Color(0xFF3b5999).withOpacity(.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Welcome to ",
                              style: TextStyle(
                                fontSize: 0.03 * maxH,
                                letterSpacing: 2,
                                color: Colors.yellow[700],
                              ),
                              children: [
                                TextSpan(
                                  text: "Housy \nCleaning Services",
                                  style: TextStyle(
                                    fontSize: 0.035 * maxH,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Please fill the details and will give the best \nservice policy to you",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: maxH * 0.32),
                child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  controller: new ScrollController(keepScrollOffset: false),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //height: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: InkWell(
                        onTap: () => page(index),
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Image.asset(
                                    images[index],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    name[index],
                                    style: TextStyle(fontSize: 0.02 * maxH),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isloading = true;
        });
        // final provider =
        //     Provider.of<GoogleSingnInProvider>(context, listen: false);
        // provider.login();
        setState(() {
          _isloading = false;
        });
      },
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(145, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
