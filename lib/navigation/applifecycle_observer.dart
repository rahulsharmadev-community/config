import 'dart:async' show StreamController;
import 'package:config/config.dart' show printLog, LogType;
import 'package:flutter/material.dart';

class ConfigAppLifecycleObserver extends StatefulWidget {
  final Widget child;
  static final StreamController<AppLifecycleState> _controller =
      StreamController<AppLifecycleState>();
  static Stream<AppLifecycleState> get stream => _controller.stream;
  const ConfigAppLifecycleObserver({required this.child, Key? key})
      : super(key: key);
  @override
  State<ConfigAppLifecycleObserver> createState() =>
      _ConfigAppLifecycleObserverState();
}

class _ConfigAppLifecycleObserverState extends State<ConfigAppLifecycleObserver>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    printLog('didChangeAppLifecycleState: $state', logType: LogType.info);
    ConfigAppLifecycleObserver._controller.sink.add(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ConfigAppLifecycleObserver._controller.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    printLog('Subscribed to app lifecycle initialize', logType: LogType.info);
  }
}
