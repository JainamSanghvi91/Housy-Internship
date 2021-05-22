import 'package:flutter/material.dart';

class MultipleChoice extends StatefulWidget {
  @override
  MultipleChoiceState createState() => new MultipleChoiceState();
}

Map<String, bool> List = {
  'Egges': false,
  'Chocolates': false,
  'Flour': false,
  'Fllower': false,
  'Fruits': false,
};

var holder_1 = [];

class MultipleChoiceState extends State {
  getItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.green,
              child: Center(
                child: Text(
                  "How many bedrooms are there?",
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
              ),
            ),
            width: 500,
            height: 60,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                getItems();
                //print(holder_1);
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
