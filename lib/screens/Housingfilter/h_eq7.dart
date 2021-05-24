import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class HQ7 extends StatefulWidget {
  HQ7(this.call);
  Function call;
  @override
  _HQ7State createState() => _HQ7State();
}

String ans, str;

class _HQ7State extends State<HQ7> {
  var _controller = TextEditingController();
  final GlobalKey<FormState> _forrmkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    str = Provider.of<P_Housing>(context, listen: false).additional;
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
                setState(() {
                  Provider.of<P_Housing>(context, listen: false).ans7(value);
                });
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
              color: Colors.blue,
              onPressed: () {
                submit();
                widget.call();
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
