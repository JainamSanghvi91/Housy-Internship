import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class hq1 extends StatefulWidget {
  @override
  _hq1State createState() => _hq1State();
}

class _hq1State extends State<hq1> {
  List items;
  int select;
  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Housing>(context, listen: false).item1;
    // for (int i = 0; i < 3; i++) {
    //   print(items.entries.elementAt(i).key);
    //   print(items.entries.elementAt(i).value);
    //   if (items.entries.elementAt(i).value == true) {
    //     select = i;
    //   }
    // }
    select = Provider.of<P_Housing>(context, listen: false).currentselected;
  }

  setSelectedRadio(int val) {
    setState(() {
      select = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Text(
                "What type of service do you need?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      print(i);
                      setState(
                        () {
                          setSelectedRadio(i);
                          Provider.of<P_Housing>(context, listen: false)
                              .ans1(i);
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[i],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Radio(
                            value: i,
                            groupValue: select,
                            onChanged: (int val) {
                              print(val);
                              setState(
                                () {
                                  setSelectedRadio(val);
                                  Provider.of<P_Housing>(context, listen: false)
                                      .ans1(val);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
