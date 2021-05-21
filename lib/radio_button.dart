import 'package:flutter/material.dart';
import 'package:housytask/size_config.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

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
                child: Column(
                  children: [
                    ButtonBar(
                      //alignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 1,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 2,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 3,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "4 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 4,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "5 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 5,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "6 bedroom",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Radio(
                                value: 6,
                                groupValue: select,
                                onChanged: (val) {
                                  print(val);
                                  setSelectedRadio(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    )
                  ],
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
                  onPressed: () {},
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
