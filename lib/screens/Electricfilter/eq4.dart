import 'package:flutter/material.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:provider/provider.dart';

class EQ4 extends StatefulWidget {
  EQ4(this.call);
  Function call;
  @override
  _EQ4State createState() => _EQ4State();
}

class _EQ4State extends State<EQ4> {
  List items;

  int select;
  String ser;
  TextEditingController controller;
  bool isdisable = true;

  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Electrician>(context, listen: false).service_place;
    // for (int i = 0; i < 3; i++) {
    //   print(items.entries.elementAt(i).key);
    //   print(items.entries.elementAt(i).value);
    //   if (items.entries.elementAt(i).value == true) {
    //     select = i;
    //   }
    // }
    ser = Provider.of<P_Electrician>(context, listen: false)
        .current_service_place;
    int count = 0;
    if (ser != "") {
      items.forEach((element) {
        if (element == ser) {
          select = count;
        }
        count++;
      });
      if(select==null){
        select=2;
      }
      if (select != 2) {
        ser = "";
      }
      isdisable = false;
    }
  }

  setSelectedRadio(int val) {
    if (val == 2) {
      if (controller == null) {
        isdisable = true;
      } else {
        if (controller.text == null || controller.text == "") {
          isdisable = true;
        }
      }
    }

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
                "Where do you want your services?",
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
              if (items.length == i) {
                return select == 2
                    ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                          initialValue: ser,
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: 'Others',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              )),
                          // keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                isdisable = true;
                              });
                            } else {
                              setState(() {
                                isdisable = false;
                              });
                            }
                             Provider.of<P_Electrician>(context, listen: false)
                                .c_service_place(value);
                            ser = value;
                          },
                        ),
                    )
                    : Container();
              }
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
                          if (i == 2) {
                            if (ser == "") {
                              setState(() {
                                isdisable = true;
                              });
                            } else {
                              setState(() {
                                isdisable = false;
                              });
                            }
                          } else {
                            Provider.of<P_Electrician>(context, listen: false)
                                .c_service_place(items[i]);
                            setState(() {
                              isdisable = false;
                            });
                          }
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
                                  if (val == 2) {
                                    if (ser == "") {
                                      setState(() {
                                        isdisable = true;
                                      });
                                    } else {
                                      setState(() {
                                        isdisable = false;
                                      });
                                    }
                                  } else {
                                    Provider.of<P_Electrician>(context,
                                            listen: false)
                                        .c_service_place(items[val]);
                                    isdisable = false;
                                  }
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
            itemCount: items.length + 1,
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
