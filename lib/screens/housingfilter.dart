import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housytask/screens/Housingfilter/h_eq3.dart';
import 'package:housytask/screens/Housingfilter/h_eq4.dart';
import 'package:housytask/screens/Housingfilter/h_eq5.dart';
import 'package:housytask/screens/Housingfilter/h_eq6.dart';
import 'package:housytask/screens/Housingfilter/h_eq7.dart';
import 'package:housytask/screens/Housingfilter/h_eq8.dart';
import 'package:housytask/screens/Housingfilter/h_eq9.dart';

import 'Housingfilter/h_eq2.dart';
import 'Housingfilter/h_eq1.dart';

class HousingFilter extends StatefulWidget {
  @override
  _HousingFilterState createState() => _HousingFilterState();
}

class _HousingFilterState extends State<HousingFilter> {
  int _selectedpage = 0;
  int totalpages = 9;
  bool isdisable = false;
  PageController _pageController;
  void _changepage(int pagenumber) {
    setState(() {
      _selectedpage = pagenumber;
      _pageController.animateToPage(pagenumber,
          duration: Duration(microseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void next() {
    if (totalpages - 1 == _selectedpage) {
      print("At the end");
    } else {
      _changepage(_selectedpage + 1);
    }
  }

  void back() {
    _changepage(_selectedpage - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => null,
          )
        ],
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        leading: _selectedpage == 0
            ? Container()
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => back(),
              ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        var maxW = constraints.maxWidth;
        var maxH = constraints.maxHeight;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (_selectedpage + 1) * maxW / totalpages,
              height: 5,
              color: Colors.blue,
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedpage = page;
                  });
                },
                controller: _pageController,
                children: [
                  HQ1(next),
                  HQ2(next),
                  HQ3(next),
                  HQ4(next),
                  HQ5(next),
                  HQ6(next),
                  HQ7(next),
                  HQ8(next),
                  HQ9(next),
                ],
              ),
              flex: 11,
            ),
          ],
        );
      }),
    );
  }
}
