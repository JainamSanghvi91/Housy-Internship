import 'package:flutter/material.dart';
import 'package:housytask/provider/p_tiffin.dart';
import 'package:provider/provider.dart';

class TQ2 extends StatefulWidget {
  TQ2(this.call);
  Function call;
  @override
  _TQ2State createState() => _TQ2State();
}

class _TQ2State extends State<TQ2> {
  Map<String, bool> List;
  int num_selected = 0;

  bool isdisable = true;
  @override
  void initState() {
    super.initState();
    List = Provider.of<P_Tiffin>(context, listen: false).item2;
    List.forEach((key, value) {
      if (value) {
        num_selected++;
      }
    });
    if (num_selected != 0) {
      isdisable = false;
    }
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
                "What are your regional preferences for the food? ",
                style: TextStyle(
                  fontSize: 18,
                                    fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView(
            children: List.keys.map((String key) {
              return Column(
                children: [
                  Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  CheckboxListTile(
                    title: new Text(key),
                    value: List[key],
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    onChanged: (bool value) {
                      if (value) {
                        num_selected++;
                      } else {
                        num_selected--;
                      }
                      if (num_selected == 0) {
                        isdisable = true;
                      } else {
                        isdisable = false;
                      }
                      setState(() {
                        List[key] = value;
                        print("Here in ");
                        Provider.of<P_Tiffin>(context, listen: false)
                            .ans2(List);
                        // holder_1[key]=value;
                      });
                    },
                  ),
                ],
              );
            }).toList(),
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
