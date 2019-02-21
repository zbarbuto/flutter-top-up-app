import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './gradient-button.dart';
import 'dart:ui';

void main() => runApp(MyApp());

const gradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
  colors: [const Color(0xFF1A1F36), const Color(0xFF41959C)], // whitish to gray
  tileMode: TileMode.repeated, // repeats the gradient over the canvas
);

const double topBarHeight = 200;
const double overlayHeight = 100;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(children: [
          Column(children: [
            Container(
              constraints: BoxConstraints(maxHeight: topBarHeight),
              decoration: BoxDecoration(
                gradient: gradient,
              ),
            ),
            Expanded(child: Text(''))
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                10.0, topBarHeight - overlayHeight / 2, 10, 0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(4, 4),
                    color: Color(0x33000000))
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        alignment: AlignmentDirectional(-1, 0.0),
                        constraints: BoxConstraints(maxHeight: 50),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Enter the card number...',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                                letterSpacing: 1),
                          ),
                        ),
                        color: Color(0x44FFFFFF)),
                  ),
                  constraints:
                      BoxConstraints(maxWidth: 400, maxHeight: overlayHeight),
                  decoration: BoxDecoration(
                    gradient: gradient,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1))),
                    child: TabBar(
                      indicatorColor: Colors.black,
                      indicatorWeight: 1,
                      tabs: <Widget>[
                        _tab('MOBILE'),
                        _tab('TELECOM'),
                        _tab('UNICOM'),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    Container(child: Text('')),
                    Container(child: Text('')),
                    Container(child: Text(''))
                  ]))
                ]),
          ),
        ]),
      ),
    );
  }

  Widget _tab(text) {
    return Tab(
      child: Text(text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w100,
              letterSpacing: 2)),
    );
  }
}
