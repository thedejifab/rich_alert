import 'package:flutter/material.dart';
import 'package:rich_alerts/widget/rich_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
              'This is to test the rich dialog',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RichAlertDialog(
                  alertTitle: RichAlertDialog.title("Alert title"),
                  alertSubtitle: RichAlertDialog.subtitle("Subtitle"),
                  alertType: RichAlertDialog.WARNING,
                  actions: <Widget>[
                    Text("hello"),
                    Text("its me"),
                  ],
                );
              });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
