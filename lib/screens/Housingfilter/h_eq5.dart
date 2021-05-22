import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class hq5 extends StatefulWidget {
  @override
  _hq5State createState() => _hq5State();
}

class _hq5State extends State<hq5> {
  Map<String, bool> List;
  @override
  void initState() {
    super.initState();
    List = Provider.of<P_Housing>(context, listen: false).item5;
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
                "Do you need any extras? ",
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
                      setState(() {
                        List[key] = value;
                        print("Here in ");
                        // Provider.of<P_Housing>(context, listen: false)
                        //     .c_type_of_work(List);
                        // holder_1[key]=value;
                      });
                    },
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
