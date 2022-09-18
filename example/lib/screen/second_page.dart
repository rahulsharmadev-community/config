import 'package:example/screen/first_page.dart';
import 'package:example/screen/third_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static const name = 'SecondPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text('First Page'),
              onPressed: () {
                Navigator.pushNamed(context, FirstPage.name);
              },
            ),
            SizedBox(height: 32),
            TextButton(
              child: Text('Third Page'),
              onPressed: () {
                Navigator.pushNamed(context, ThirdPage.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
