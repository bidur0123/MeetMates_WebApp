import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: WeekView(
        controller: EventController(),
        eventTileBuilder: (date, events, boundary, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        fullDayEventBuilder: (events, date) {
          // Return your widget to display full day event view.
          return Container();
        },
        showLiveTimeLineInAllDays: true, // To display live time line in all pages in week view.
        width: w, // width of week view.
        minDay: DateTime(2000),
        maxDay: DateTime(2050),
        initialDay: currentDate,
        heightPerMinute: 1,
        eventArranger: const SideEventArranger(),
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
        startDay: WeekDays.monday,
        startHour: 5 ,
        weekPageHeaderBuilder: WeekHeader.hidden, // To hide week header
      ),
    );
  }
}
