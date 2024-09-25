import 'package:flutter/material.dart';
import 'package:trialml/presentation/recognition/recognition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expression Recognition',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/recognition': (context) => Recognition(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: ButtonTheme(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/recognition');
            },
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              backgroundColor: Colors.cyan,
              minimumSize: Size(100, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text('Recognize Your Expression'),
          ),
        ),
      ),
    );
  }
}
