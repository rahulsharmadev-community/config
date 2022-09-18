import 'package:example/screen/second_page.dart';
import 'package:example/screen/third_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  static const name = 'FirstPage';

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 32),
            TextButton(
              child: const Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, SecondPage.name);
              },
            ),
            const SizedBox(height: 32),
            TextButton(
              child: const Text('Third Page'),
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
