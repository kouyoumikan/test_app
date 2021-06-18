import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_app/pages/add_event.dart';

import 'package:test_app/pages/calendar.dart';
import 'package:test_app/pages/home.dart';

void main() {
//  runApp(MyApp());
  initializeDateFormatting().then((_) =>runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // デフォルトのルーティング
      //home: HomePage(), // initialRouteと同じ
      initialRoute: '/home', // アプリを開いた時にロードする最初のルート
      // ルーティングの一覧を設定
      routes: {
        //'/': (context) => MainPage(), // ホーム画面
        '/home': (context) => Home(), // ホーム画面
        '/calendar': (context) => Calendar(), // カレンダー画面
        '/add_event': (context) => AddEvent(), // カレンダー入力画面
      },
    );
  }
}

//void main() {
//  initializeDateFormatting().then((_) => runApp(MyApp()));
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'TableCalendar Example',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: StartPage(),
//    );
//  }
//}
//
//class StartPage extends StatefulWidget {
//  @override
//  _StartPageState createState() => _StartPageState();
//}
//
//class _StartPageState extends State<StartPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('TableCalendar Example'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            const SizedBox(height: 20.0),
//            ElevatedButton(
//              child: Text('Basics'),
//              onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (_) => Home()),
//              ),
//            ),
//            const SizedBox(height: 12.0),
//            ElevatedButton(
//              child: Text('Range Selection'),
//              onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (_) => Calendar()),
//              ),
//            ),
//            const SizedBox(height: 12.0),
//            ElevatedButton(
//              child: Text('Events'),
//              onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (_) => TableEventsExample()),
//              ),
//            ),
//            const SizedBox(height: 12.0),
//            ElevatedButton(
//              child: Text('Multiple Selection'),
//              onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (_) => TableMultiExample()),
//              ),
//            ),
//            const SizedBox(height: 12.0),
//            ElevatedButton(
//              child: Text('Complex'),
//              onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (_) => TableComplexExample()),
//              ),
//            ),
//            const SizedBox(height: 20.0),
//          ],
//        ),
//      ),
//    );
//  }
//}