import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class HQ1 extends StatefulWidget {
  HQ1(this.call);
  Function call;
  @override
  _HQ1State createState() => _HQ1State();
}

class _HQ1State extends State<HQ1> {
  List items;
  int select;
  int num_selected = 0;

  bool isdisable = true;
  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Housing>(context, listen: false).item1;
    select = Provider.of<P_Housing>(context, listen: false).currentans1;
    if (select != -1) {
      isdisable = false;
    }
  }

  setSelectedRadio(int val) {
    isdisable = false;
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
              color: isdisable ? Colors.blue[200] : Colors.blue,
              onPressed: () {
                return isdisable ? null : widget.call();
              },
              child: Text(
                "NEXT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
