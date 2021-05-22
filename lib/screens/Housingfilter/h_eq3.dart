import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class hq3 extends StatefulWidget {
  @override
  _hq3State createState() => _hq3State();
}

class _hq3State extends State<hq3> {
  List items;
  int select;
  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Housing>(context, listen: false).item3;
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
            //color: Colors.green,
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
                          print("Here in ");
                          // Provider.of<P_Housing>(context, listen: false)
                          //     .ans1(i);
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
                                  print("Here in ");
                                  // Provider.of<P_Housing>(context, listen: false)
                                  //     .ans1(val);
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
