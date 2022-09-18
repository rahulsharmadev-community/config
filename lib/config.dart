library config;

import 'package:flutter/material.dart'
    show ScaffoldMessengerState, NavigatorState, GlobalKey, MaterialPageRoute;
import 'package:flutter/widgets.dart';
import 'utilities/printlog.dart';
export 'utilities/utilities.dart';
export 'widgets/widgets.dart';
export 'utilities/regexp_fun.dart';
part 'navigation/navigator_observer.dart';

ScaffoldMessengerState get messenger => Config.messengerKey.currentState!;

NavigatorState get navigation => Config.navigatorKey.currentState!;
MaterialPageRoute<dynamic> buildPageRoute(RouteSettings settings,
        {required Widget child}) =>
    MaterialPageRoute(builder: (_) => child, settings: settings);

const pageNotFound = const Center(
    child: DefaultTextStyle(style: TextStyle(), child: Text('Page Not Found')));

class Config {
  /// Use to indicate that the app is in debug mode.
  /// By default `isDebugMode = turn`,
  /// You can change the value by using. `Config.isDebugMode=false,`
  ///
  /// example
  /// ```
  ///   MaterialApp(
  ///       debugShowCheckedModeBanner: Config.isDebugMode=false,
  ///       //..
  ///      );
  ///   ```
  static bool isDebugMode = true;

  /// A key to use when building the [Navigator].
  static final navigatorKey = GlobalKey<NavigatorState>();

  /// A key to use when building the [ScaffoldMessenger].
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  /// For Customizable log use\
  ///  enableTime, disableLog, disableRouteLocation,
  ///  enableOperation, enableAttributes, showTime
  ///
  /// eg. ```navigatorObserver..enableOperation..enableAttributes```
  static final navigatorObserver = _ConfigNavigatorObserver();
}
