import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:housytask/dummydata.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:housytask/screens/electricfilter.dart';
import 'package:housytask/screens/housingfilter.dart';
import 'package:housytask/screens/massagefilter.dart';
import 'package:housytask/star.dart';
import 'package:housytask/user.dart';
import 'package:provider/provider.dart';

class PersonListPage extends StatelessWidget {
  static final String routename = '/particular-page';

  @override
  Widget build(BuildContext context) {
    var ele = Provider.of<P_Electrician>(context, listen: false);
    ele.changeval();
    List<User> lis = Dummy_electrician.where((element) {
      if(ele.val){
        return element.work%2==0;  
      }
      else{
        return element.work%2!=0;
      }
      // ele.val % element.work == 0;
    }).toList();
    print("ele is ${ele.val}");
    var maxW = MediaQuery.of(context).size.width;
    var details =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String call = details['next'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          call == HousingFilter.routename
              ? "House Service"
              : call == ElectriFilter.routename
                  ? "Electrician"
                  : call == MassageFilter.routename
                      ? "Massage Service"
                      : "Tiffin Service",
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(call),
          child: Icon(Icons.filter_list_outlined)),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTileItem2(maxW: maxW, lis: lis[i]);
        },
        itemCount: lis.length,
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key key,
    @required this.maxW,
    @required this.lis,
  }) : super(key: key);

  final double maxW;
  final User lis;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  lis.image,
                  // "assets/images/elect1.jpg",
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
                                  lis.name,
                                  // "Joseph Farnandis",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  lis.company,
                                  // "Sky Techniques",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 14),
                                  Text(
                                    lis.location,
                                    // "Morbi, Gujarat",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(color: Colors.white),
                          ),
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
                            "${lis.price}/hrs",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                lis.rattings == 4 ? "Great : " : "Excellent",
                                style: TextStyle(color: Colors.green),
                              ),
                              StarDisplay(
                                value: lis.rattings,
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
  }
}

class ListTileItem2 extends StatelessWidget {
  const ListTileItem2({
    Key key,
    @required this.maxW,
    @required this.lis,
  }) : super(key: key);

  final double maxW;
  final User lis;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  lis.image,
                  // "assets/images/elect1.jpg",
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
                                  lis.name,
                                  // "Joseph Farnandis",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  lis.company,
                                  // "Sky Techniques",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    lis.rattings == 4
                                        ? "Great : "
                                        : "Excellent",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  StarDisplay(
                                    value: lis.rattings,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(color: Colors.white),
                          ),
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
                            "${lis.price}/hrs",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14),
                              Text(
                                lis.location,
                                // "Morbi, Gujarat",
                                style: TextStyle(fontSize: 14),
                              )
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
  }
}
