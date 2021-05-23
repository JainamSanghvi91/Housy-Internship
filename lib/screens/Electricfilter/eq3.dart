import 'package:flutter/material.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:provider/provider.dart';

class EQ3 extends StatefulWidget {
   EQ3(this.call);
  Function call;
  @override
  _EQ3State createState() => _EQ3State();
}

class _EQ3State extends State<EQ3> {
  List items;
  int select;
  bool isdisable=true;
  @override
  void initState() {
    super.initState();
    items = Provider.of<P_Electrician>(context, listen: false).height_ceiling;
    // for (int i = 0; i < 3; i++) {
    //   print(items.entries.elementAt(i).key);
    //   print(items.entries.elementAt(i).value);
    //   if (items.entries.elementAt(i).value == true) {
    //     select = i;
    //   }
    // }
    select = Provider.of<P_Electrician>(context, listen: false).currentheight;
    if(select!=-1){
      isdisable=false;
    }
  }

  setSelectedRadio(int val) {
    isdisable=false;
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
                "Approximate height of the ceiling?",
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
                          Provider.of<P_Electrician>(context, listen: false)
                              .c_height(i);
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
                                  Provider.of<P_Electrician>(context, listen: false)
                                      .c_height(val);
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
            child: 
                 RaisedButton(
                  // disabledColor: Colors.blue[200],
                  color: isdisable ? Colors.blue[200] : Colors.blue,
                  onPressed: () {
                    return isdisable ? null :  widget.call();
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              
            ),
      ],
    );
  }
}
