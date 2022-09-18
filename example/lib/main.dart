import 'package:example/screen/first_page.dart';
import 'package:example/screen/second_page.dart';
import 'package:example/screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:config/config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: Config.isDebugMode,
        title: 'Flutter Demo',
        navigatorKey: Config.navigatorKey,
        scaffoldMessengerKey: Config.messengerKey,
        navigatorObservers: [Config.navigatorObserver],
        initialRoute: FirstPage.name,
        onGenerateRoute: (settings) => Config.routeGenerater(settings, routes: {
              FirstPage.name: FirstPage(/*settings.arguments*/),
              SecondPage.name: SecondPage(/*settings.arguments*/),
              ThirdPage.name: ThirdPage(/*settings.arguments*/)
              //.....
              //...
            }));
  }
}
