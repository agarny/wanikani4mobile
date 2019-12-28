import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaniKani for Mobile',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF294DDC, <int, Color>{
          50: Color.fromRGBO(41, 77, 220, 0.1),
          100: Color.fromRGBO(41, 77, 220, 0.2),
          200: Color.fromRGBO(41, 77, 220, 0.3),
          300: Color.fromRGBO(41, 77, 220, 0.4),
          400: Color.fromRGBO(41, 77, 220, 0.5),
          500: Color.fromRGBO(41, 77, 220, 0.6),
          600: Color.fromRGBO(41, 77, 220, 0.7),
          700: Color.fromRGBO(41, 77, 220, 0.8),
          800: Color.fromRGBO(41, 77, 220, 0.9),
          900: Color.fromRGBO(41, 77, 220, 1.0),
        }),
      ),
      home: MyHomePage(title: 'WaniKani for Mobile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
