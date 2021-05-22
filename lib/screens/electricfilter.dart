import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housytask/screens/Electricfilter/eq1.dart';
import 'package:housytask/screens/Electricfilter/eq2.dart';
import 'package:housytask/screens/Electricfilter/eq3.dart';
import 'package:housytask/screens/Electricfilter/eq4.dart';
import 'package:housytask/screens/Electricfilter/eq5.dart';
import 'package:housytask/screens/Electricfilter/eq6.dart';
import 'package:housytask/screens/Electricfilter/eq7.dart';

class ElectriFilter extends StatefulWidget {
  @override
  _ElectriFilterState createState() => _ElectriFilterState();
}

class _ElectriFilterState extends State<ElectriFilter> {
  int _selectedpage = 0;
  int totalpages=7;
  bool isdisable=false;
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

  void next(){
    if(totalpages-1==_selectedpage){
      print("At the end");
    }
    else{
      _changepage(_selectedpage+1);
    }
  }

  void back(){
    _changepage(_selectedpage-1);
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
        leading: _selectedpage==0?Container(): IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => back(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var maxW=constraints.maxWidth;
          var maxH=constraints.maxHeight;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (_selectedpage+1)*maxW/totalpages,
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
                    EQ1(),
                    EQ2(),
                    EQ3(),
                    EQ4(),
                    EQ5(),
                    EQ6(),
                    EQ7(),
                  ],
                ),
                flex: 11,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                )),
                width: 500,
                height: 60,
                child: RaisedButton(
                  
                  // disabledColor: Colors.blue[200],
                  color: isdisable?Colors.blue[200]: Colors.blue,
                  onPressed: () {
                    return isdisable?null:next();
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
