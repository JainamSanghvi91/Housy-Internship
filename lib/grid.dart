import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

int isSelect;

class _GridState extends State<Grid> {
  setToggle(int ind) {
    setState(() {
      isSelect = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  "What type of service do you need?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              controller: new ScrollController(keepScrollOffset: false),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //height: 400,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () {
                      setToggle(index);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.network(
                                    "https://m.cricbuzz.com/a/img/v1/192x192/i1/c170661/virat-kohli.jpg",
                                  ),
                                ),
                                isSelect == index
                                    ? Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                isSelect == index
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text("Virat Kohli"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//   padding: EdgeInsets.all(5),
//   decoration: BoxDecoration(
//       border: Border(
//     top: BorderSide(
//       color: Colors.black,
//       width: 0.5,
//     ),
//   )),
//   width: 500,
//   height: 60,
//   child: RaisedButton(
//     color: Colors.blue,
//     onPressed: () {},
//     child: Text(
//       "NEXT",
//       style: TextStyle(color: Colors.white, fontSize: 18),
//     ),
//   ),
// ),
//   ],
// ),
