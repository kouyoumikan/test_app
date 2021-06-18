import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:test_app/model/routes.dart';

import 'event.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
//  CalendarController _calendarController;
//
//  @override
//  void initState() {
//    super.initState();
//    _calendarController = CalendarController();
//  }

  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

//  @override
//  void initState() {
//    selectedEvents = {};
//    super.initState();
//    _calendarController = CalendarController();
//  }

//  @override
//  void didChangeDependencies() {
//    context.read(pnProvider).init();
//    super.didChangeDependencies();
//  }


//  List<Event> _getEventsfromDay(DateTime date) {
//    return selectedEvents[date] ?? [];
//  }
//
//  @override
//  void dispose() {
//    _eventController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase starter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, "/home"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //calendarController: _calendarController,
              locale: 'ja_JP', // カレンダーの言語を日本語で設定
              weekendDays: [7], //
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              // フォーマット変更のボタン押下時の処理
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              //eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              //右上にあるカレンダー表示の切り替えボタンのカスタマイズ
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
//                leftChevronVisible: false, // 左上の矢印を非表示
//                rightChevronVisible: false, // 右上の矢印を非表示
                headerPadding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 1.0
                ),
              ),
              // カレンダーのイベント数を数字で表示するようにカスタマイズ
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isNotEmpty) {
                    return _buildEventsMarker(date, events);
                  }
                },
              ),
//              calendarBuilders: CalendarBuilders(
//                selectedBuilder: (context, date, events) => Container(
//                    margin: const EdgeInsets.all(4.0),
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        color: Theme.of(context).primaryColor,
//                        borderRadius: BorderRadius.circular(10.0)),
//                    child: Text(
//                      date.day.toString(),
//                      style: TextStyle(color: Colors.white),
//                    )),
//                holidayBuilder: (context, date, events) => Container(
//                    margin: const EdgeInsets.all(4.0),
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        color: Colors.orange,
//                        borderRadius: BorderRadius.circular(10.0)),
//                    child: Text(
//                      date.day.toString(),
//                      style: TextStyle(color: Colors.white),
//                    )),
//              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () => showDialog(
//          context: context,
//          builder: (context) => AlertDialog( // ボタン押下後、ダイアログの表示
//            title: Text("Add Event"),
//            content: TextFormField( // テキストフィールド
//              controller: _eventController,
//            ),
//            actions: [
//              TextButton(
//                child: Text("Cancel"),
//                onPressed: () => Navigator.pop(context),
//              ),
//              TextButton(
//                child: Text("Ok"),
//                onPressed: () {
//                  if (_eventController.text.isEmpty) {
//
//                  } else {
//                    if (selectedEvents[selectedDay] != null) {
//                      selectedEvents[selectedDay]!.add(
//                        Event(title: _eventController.text),
//                      );
//                    } else {
//                      selectedEvents[selectedDay] = [
//                        Event(title: _eventController.text)
//                      ];
//                    }
//
//                  }
//                  Navigator.pop(context);
//                  _eventController.clear();
//                  setState((){});
//                  return;
//                },
//              ),
//            ],
//          ),
//        ),
//        label: Text("Add Event"),
//        icon: Icon(Icons.add),
//      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add_event');
          //Navigator.pushNamed(context, AppRoutes.addEvent, arguments: selectedDay);
        },
        //onPressed: () => Navigator.pushNamed(context, '/add_event'),
        //onPressed: () => Navigator.of(context).pushNamed("/add_event"),
      ),
    );
  }
}

// カレンダーのイベント数を赤丸の数字で表示
Widget _buildEventsMarker(DateTime date, List events) {
  return Positioned(
    right: 5,
    bottom: 5,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red[300],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    ),
  );
}
