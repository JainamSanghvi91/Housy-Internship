import 'package:flutter/material.dart';
import 'package:housytask/provider/p_tiffin.dart';
import 'package:provider/provider.dart';

class TQ3 extends StatefulWidget {
  @override
  _TQ3State createState() => _TQ3State();
}

class _TQ3State extends State<TQ3> {
  Map<String, bool> List;
  @override
  void initState() {
    super.initState();
    List = Provider.of<P_Tiffin>(context, listen: false).item3;
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
                "What time of the day do you need service? ",
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
                        Provider.of<P_Tiffin>(context, listen: false)
                            .ans3(List);
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
