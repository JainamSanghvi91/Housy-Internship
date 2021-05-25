import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:housytask/screens/PersonListpage.dart';
import 'package:housytask/screens/housingfilter.dart';
import 'package:provider/provider.dart';

class HQ9 extends StatefulWidget {
  HQ9(this.call);
  Function call;
  @override
  _HQ9State createState() => _HQ9State();
}

class _HQ9State extends State<HQ9> {
  Map<String, bool> List;
  @override
  void initState() {
    super.initState();
    List = Provider.of<P_Housing>(context, listen: false).item9;
    List.forEach((key, value) {
      if (value) {
        num_selected++;
      }
    });
    if (num_selected != 0) {
      isdisable = false;
    }
  }

  int num_selected = 0;

  bool isdisable = true;

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
                "Do you need any extras? ",
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
                        Provider.of<P_Housing>(context, listen: false)
                            .ans9(List);
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
                if (isdisable) {
                  return null;
                } else {
                                    Provider.of<P_Housing>(context,listen: false).changefirst();

                  return Navigator.of(context).pushReplacementNamed(
                      PersonListPage.routename,
                      arguments: {'next': HousingFilter.routename});
                }
              },
              child: Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
