import 'package:flutter/material.dart';
import 'package:housytask/provider/p_massage.dart';
import 'package:housytask/screens/PersonListpage.dart';
import 'package:housytask/screens/massagefilter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class MQ7 extends StatefulWidget {
  MQ7(this.call);
  Function call;
  @override
  _MQ7State createState() => _MQ7State();
}

class _MQ7State extends State<MQ7> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = Provider.of<P_Massage>(context, listen: false).date;
    _focusDay = _selectedDay;
  }

  void next() {
    Provider.of<P_Massage>(context, listen: false).ans7(_selectedDay);
                  Provider.of<P_Massage>(context,listen: false).changefirst();

    Navigator.of(context).pushReplacementNamed(PersonListPage.routename,arguments: {'next':MassageFilter.routename});
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
                "When would you like this program to start?",
                style: TextStyle(
                  fontSize: 18,
                                    fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ),
        ),
        Divider(),
        Expanded(
          flex: 7,
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
