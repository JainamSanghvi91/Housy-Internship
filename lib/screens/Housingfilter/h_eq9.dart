import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';

class HQ9 extends StatefulWidget {
  @override
  _HQ9State createState() => _HQ9State();
}

class _HQ9State extends State<HQ9> {
  Map<String, bool> List;
  @override
  void initState() {
    super.initState();
    List = Provider.of<P_Housing>(context, listen: false).item9;
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
      ],
    );
  }
}
