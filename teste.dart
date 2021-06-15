import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? title;
  String description = "";

  void scrapData() async {
    final url = 'https://santo.cancaonova.com/';
    var response = await Chaleno().load(url);

    title = response?.querySelector('.entry-title').text;

    final data = response?.querySelectorAll('.content-santo p');

    for (final item in data!) {
      description += '${item.text}\n\n';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scrapData();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('$description'),
          ],
        ),
      ),
    );
  }
}
