import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:housytask/star.dart';

class PersonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var maxW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Technicience",
        ),
      ),
      body: Column(
        children: [
          Text("Best Results from your filter"),
          Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
              return  Container(
              height: 110,
              width: maxW,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 90,
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/images/elect1.jpg",
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "Joseph Farnandis",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Sky Techniques",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on, size: 14),
                                          Text(
                                            "Morbi, Gujarat",
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                  padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                                  decoration: BoxDecoration(color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.black,
                                      )),
                                  child: Text("Book Now!",style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "80/hrs",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Great : ",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      StarDisplay(
                                        value: 3,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    flex: 3,
                  )
                ],
              ),
            );
       
            },itemCount: 10,),
          )
          ],
      ),
    );
  }
}
