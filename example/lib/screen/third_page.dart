import 'package:example/screen/first_page.dart';
import 'package:example/screen/second_page.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static const name = 'ThirdPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 32),
            RaisedButton(
              child: Text('First Page'),
              onPressed: () {
                Navigator.pushNamed(context, FirstPage.name);
              },
            ),
            SizedBox(height: 32),
            RaisedButton(
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, SecondPage.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
