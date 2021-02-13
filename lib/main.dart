import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/landing_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/loading_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/login_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/map_view.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/signup_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
      ],
      child: MaterialApp(
        title: 'F4RTech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Gilroy',
        ),
        home: MapView(),
      ),
    );
  }
}
/*
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
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gilroy',
      ),
      home: LogInPage(false),
    );
  }
}*/
