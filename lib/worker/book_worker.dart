import 'package:handi/constants.dart';
import 'package:handi/styles/all.Style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class BookWorker extends StatefulWidget {
  const BookWorker({Key? key}) : super(key: key);

  @override
  _BookWorkerState createState() => _BookWorkerState();
}

class _BookWorkerState extends State<BookWorker> {
  DateTime _selectedDay = DateTime.now();
  List<dynamic> _selectedEvents = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Worker",
          style: black,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            eventLoader: (day) {
              return _getEventsForDay(day);
            },
            headerStyle: HeaderStyle(formatButtonVisible: false),
            calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                selectedDecoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                markerDecoration: BoxDecoration(
                    color: kPrimaryColor.withAlpha(150),
                    borderRadius: BorderRadius.circular(10)),
                canMarkersOverflow: false,
                markersMaxCount: 1),
            onDaySelected: (selected, focus) {
              setState(() {
                _selectedDay = selected;
                _selectedEvents = _getEventsForDay(_selectedDay);
              });
            },
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children:
                      _selectedEvents.map((slot) => _timeSlot(slot)).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell _timeSlot(slot) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
        width: MediaQuery.of(context).size.width - kDefaultPadding,
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 1),
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
        ),
        child: Text(
          slot,
          style: bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

List<dynamic> _getEventsForDay(DateTime day) {
  if (_eventDays.contains(day)) return ["9:15 AM", "10:30 AM", "1:25 PM"];
  return [];
}

List<DateTime> _eventDays = [
  DateTime.utc(2021, 10, 4),
  DateTime.utc(2021, 10, 6),
  DateTime.utc(2021, 10, 7),
  DateTime.utc(2021, 10, 8),
  DateTime.utc(2021, 10, 12),
  DateTime.utc(2021, 10, 13),
  DateTime.utc(2021, 10, 20),
];
