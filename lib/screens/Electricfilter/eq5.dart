import 'package:flutter/material.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:provider/provider.dart';

class EQ5 extends StatefulWidget {
  EQ5(this.call);
  Function call;
  @override
  _EQ5State createState() => _EQ5State();
}

class _EQ5State extends State<EQ5> {
    final GlobalKey<FormState> _forrmkey2 = GlobalKey();

  bool isdisable = false;
  String instruction="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instruction=Provider.of<P_Electrician>(context,listen: false).instruction;
  }

  void next(){
    _forrmkey2.currentState.save();
    Provider.of<P_Electrician>(context,listen: false).instruction=instruction;
    widget.call();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Container(
          child: Center(
            child: Text(
              "Additional details if any?",
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
        child: Form(
          key: _forrmkey2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: TextFormField(
                      initialValue: instruction,
            // controller: controller,
            decoration: InputDecoration(
                labelText: 'Additional Info',
                labelStyle: TextStyle(
                    color: Colors.grey,
                )),
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) {
              instruction=newValue;  
            },
            
          ),
                  ),
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
            return isdisable ? null : next();
          },
          child: Text(
            "NEXT",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ]);
  }
}
