import 'package:flutter/material.dart';
import 'package:housytask/provider/p_massage.dart';
import 'package:provider/provider.dart';

class MQ5 extends StatefulWidget {
  @override
  _MQ5State createState() => _MQ5State();
}

String ans, str;

class _MQ5State extends State<MQ5> {
  var _controller = TextEditingController();
  final GlobalKey<FormState> _forrmkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    str = Provider.of<P_Massage>(context, listen: false).additional;
    print(str);
  }

  void submit() {
    _forrmkey.currentState.save();
    setState(() {
      ans = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forrmkey,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.green,
              child: Center(
                child: Text(
                  "Additional details if any?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: TextFormField(
              initialValue: str,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(),
                ),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.all(10),
                hintText: "Additional details",
                hintStyle: TextStyle(fontSize: 15),
              ),
              onSaved: (value) {
                Provider.of<P_Massage>(context, listen: false).ans5(value);
              },
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
              color: Colors.blue,
              onPressed: () {
                submit();
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
  }
}
