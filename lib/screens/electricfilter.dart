import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:housytask/screens/Electricfilter/eq1.dart';
import 'package:housytask/screens/Electricfilter/eq2.dart';
import 'package:housytask/screens/Electricfilter/eq3.dart';
import 'package:housytask/screens/Electricfilter/eq4.dart';
import 'package:housytask/screens/Electricfilter/eq5.dart';
import 'package:housytask/screens/Electricfilter/eq6.dart';
import 'package:housytask/screens/Electricfilter/eq7.dart';
import 'package:provider/provider.dart';

class ElectriFilter extends StatefulWidget {
  @override
  _ElectriFilterState createState() => _ElectriFilterState();
}

class _ElectriFilterState extends State<ElectriFilter> {
  int _selectedpage = 0;
  int totalpages = 7;
  PageController _pageController;
  void _changepage(int pagenumber) {
    print("current page will be $pagenumber");
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
                  EQ1(next),
                  EQ2(next),
                  EQ3(next),
                  EQ4(next),
                  EQ5(next),
                  EQ6(next),
                  EQ7(next),
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
