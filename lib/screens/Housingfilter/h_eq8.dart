import 'package:flutter/material.dart';
import 'package:housytask/provider/p_housing.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HQ8 extends StatefulWidget {
  HQ8(this.call);
  Function call;
  @override
  _HQ8State createState() => _HQ8State();
}

class _HQ8State extends State<HQ8> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = Provider.of<P_Housing>(context, listen: false).date;
    _focusDay = _selectedDay;
  }

  void next() {
    Provider.of<P_Housing>(context, listen: false).ans8(_selectedDay);
    widget.call();
  }

  int num_selected = 0;

  bool isdisable = true;

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
                return widget.call();
              },
              child: Text(
                "NEXT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
