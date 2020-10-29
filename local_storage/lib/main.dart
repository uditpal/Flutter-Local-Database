import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/profile.dart';
import 'Database/moor_database.dart';
import 'UI/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        title: 'Material App',
        home: Homie(),
      ),
    );
  }
}

class Homie extends StatelessWidget {
  const Homie({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return FutureBuilder(
        future: database.getAllProfiles(),
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return Homepage();
          } else {
            return Details();
          }
        });
  }
}
