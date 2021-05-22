import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:housytask/provider/p_massage.dart';
import 'package:provider/provider.dart';

class MQ3 extends StatefulWidget {
  @override
  _MQ3State createState() => _MQ3State();
}

class _MQ3State extends State<MQ3> {
  List items;
  int select;
  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Massage>(context, listen: false).item3;
    select = Provider.of<P_Massage>(context, listen: false).currentans3;
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
                "What type of massage would you like?",
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
                          Provider.of<P_Massage>(context, listen: false)
                              .ans3(i);
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
                                  Provider.of<P_Massage>(context, listen: false)
                                      .ans3(val);
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
