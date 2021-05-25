import 'package:flutter/material.dart';
import 'package:housytask/provider/p_electrician.dart';
import 'package:housytask/screens/PersonListpage.dart';
import 'package:housytask/screens/electricfilter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class EQ7 extends StatefulWidget {
  EQ7(this.call);
  Function call;
  @override
  _EQ7State createState() => _EQ7State();
}

class _EQ7State extends State<EQ7> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = Provider.of<P_Electrician>(context, listen: false).date;
        print(" before _selecteday is init ${_selectedDay}");

    if(_selectedDay==null){
      _selectedDay=DateTime.now();
    }
    print("_selecteday is init ${_selectedDay}");
    _focusDay = _selectedDay;
  }


  void next(){
    Provider.of<P_Electrician>(context,listen: false).c_date(_selectedDay);
    // print("${Provider.of<P_Electrician>(context,listen: false).date}");
    // print("next method select day is ${_selectedDay}");
    Navigator.of(context).pushReplacementNamed(PersonListPage.routename,arguments: {'next':ElectriFilter.routename});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            // focusedDay: DateTime.utc(2021, 5, 30),
            focusedDay: _selectedDay,
            selectedDayPredicate: (DateTime date) {
              return isSameDay(_selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle
                      // borderRadius: BorderRadius.circular(5.0),
                      ),
              selectedTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              print("selectedday $selectedDay");
              setState(() {
                _selectedDay = selectedDay;
                _focusDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onPageChanged: (focusedDay) {
              _focusDay = focusedDay;
            },
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            calendarFormat: format,
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
              return next();
            },
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
