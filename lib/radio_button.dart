import 'package:flutter/material.dart';
import 'package:housytask/size_config.dart';

class RadioButton extends StatefulWidget {
  var item;
  RadioButton(
    this.item,
  );
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

String ans = "";
// List item = [
//   '1 Bedroom',
//   '2 Bedroom',
//   '3 Bedroom',
//   '4 Bedroom',
//   '5 Bedroom',
//   '6 Bedroom',
// ];

class _RadioButtonState extends State<RadioButton> {
  int select;
  @override
  void initState() {
    super.initState();
    select = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      select = val;
      ans = widget.item[select];
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        var maxW = SizeConfig.heightMultiplier * 100;
        var maxH = SizeConfig.widthMultiplier * 100;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "Details",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            actions: [],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.green,
                  child: Center(
                    child: Text(
                      "How many bedrooms are there?",
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
                            setSelectedRadio(i);
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
                                  widget.item[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Radio(
                                  value: i,
                                  groupValue: select,
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      ans = widget.item[val];
                                      print("AND" + widget.item[val]);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: widget.item.length,
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
                  color: Colors.blue,
                  onPressed: () {
                    print(ans);
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 10,
//     right: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "1 bedroom",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       Radio(
//         value: 1,
//         groupValue: select,
//         onChanged: (val) {
//           print(val);
//           setSelectedRadio(val);
//         },
//       ),
//     ],
//   ),
// ),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 10,
//     right: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "2 bedroom",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       Radio(
//         value: 2,
//         groupValue: select,
//         onChanged: (val) {
//           print(val);
//           setSelectedRadio(val);
//         },
//       ),
//     ],
//   ),
// ),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 10,
//     right: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "3 bedroom",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       Radio(
//         value: 3,
//         groupValue: select,
//         onChanged: (val) {
//           print(val);
//           setSelectedRadio(val);
//         },
//       ),
//     ],
//   ),
// ),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 10,
//     right: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "4 bedroom",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       Radio(
//         value: 4,
//         groupValue: select,
//         onChanged: (val) {
//           print(val);
//           setSelectedRadio(val);
//         },
//       ),
//     ],
//   ),
// ),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 10,
//     right: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "5 bedroom",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       Radio(
//         value: 5,
//         groupValue: select,
//         onChanged: (val) {
//           print(val);
//           setSelectedRadio(val);
//         },
//       ),
//     ],
//   ),
// ),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
