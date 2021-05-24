import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housytask/screens/Tiffinfilter/tq1.dart';
import 'package:housytask/screens/Tiffinfilter/tq2.dart';
import 'package:housytask/screens/Tiffinfilter/tq3.dart';

class TiffinFilter extends StatefulWidget {
  static final String routename = '/tiffin-page';
  @override
  _TiffinFilterState createState() => _TiffinFilterState();
}

class _TiffinFilterState extends State<TiffinFilter> {
  int _selectedpage = 0;
  int totalpages = 3;
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
            onPressed: () => Navigator.of(context).pop(),
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
                  TQ1(next),
                  TQ2(next),
                  TQ3(next),
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
