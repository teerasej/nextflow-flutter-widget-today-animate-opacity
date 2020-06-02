import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Flutter Widget Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 นาที: AnimateOpacity'),
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
  bool isFade = true;
  double defaultOpacity = 0.5;

  hoverOn() {
    if (isFade) {
      setState(() {
        defaultOpacity = 1;
        isFade = false;
      });
    } else {
      setState(() {
        defaultOpacity = 0.5;
        isFade = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: GestureDetector(
              onTap: hoverOn,
              child: AnimatedOpacity(
                  opacity: defaultOpacity,
                  duration: Duration(seconds: 1),
                  child: Image.asset('images/inhouse1.jpg'))),
        ));
  }
}
