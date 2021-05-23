import 'package:flutter/material.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:provider/provider.dart';

class EQ1 extends StatefulWidget {
  EQ1(this.call);
  Function call;
  @override
  _EQ1State createState() => _EQ1State();
}

class _EQ1State extends State<EQ1> {
  Map<String, bool> lis2;
  int num_selected = 0;
  bool isdisable=true;
  @override
  void initState() {
    super.initState();
    lis2 = Provider.of<P_Electrician>(context, listen: false).type_of_work;
    lis2.forEach((key, value) {
      if(value){
        num_selected++;
      }
    });
    if(num_selected!=0){
      isdisable=false;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    print("in eq1");
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            //color: Colors.green,
            child: Center(
              child: Text(
                "What type of work do you have? ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView(
            children: lis2.keys.map((String key) {
              return Column(
                children: [
                  Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  CheckboxListTile(
                    title: new Text(key),
                    value: lis2[key],
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    onChanged: (bool value) {
                      if(value){
                        num_selected++;
                      }
                      else{
                        num_selected--;
                      }
                      if(num_selected==0){
                        isdisable=true;
                      }
                      else{
                        isdisable=false;
                      }
                      setState(() {
                        lis2[key] = value;
                        Provider.of<P_Electrician>(context, listen: false)
                            .c_type_of_work(lis2);
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
