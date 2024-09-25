import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expression Recognition',
      home: Scaffold(
        appBar: null,
        body: Center(
          child: ButtonTheme(
            child: ElevatedButton(
              onPressed: () {
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                  backgroundColor: Colors.cyan,
                  minimumSize: Size(100, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: Text('Recognize Your Expression'),
            ),
          ),
        ),
      ),
    );
  }
}
