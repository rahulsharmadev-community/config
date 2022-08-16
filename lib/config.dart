library config;

import 'package:flutter/material.dart'
    show ScaffoldMessengerState, NavigatorState, GlobalKey, MaterialPageRoute;
import 'package:flutter/widgets.dart';
import 'utilities/printlog.dart';
export 'utilities/utilities.dart';
export 'widgets/widgets.dart';
part 'navigation/navigator_observer.dart';
part 'navigation/route.dart';

ScaffoldMessengerState get messenger => Config.messengerKey.currentState!;

NavigatorState get navigation => Config.navigatorKey.currentState!;

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

  /// ## How to use
  /// ```
  /// Config.routes({
  ///        FirstPage.name: FirstPage(/*settings.arguments*/),
  ///         SecondPage.name: SecondPage(/*settings.arguments*/),
  ///         ThirdPage.name: ThirdPage(/*settings.arguments*/)
  ///        //...
  ///     }).onGenerater
  /// ```
  /// Use the "error404" parameter when the page cannot be found
  static routes(Map<String, Widget> routes, {Widget? error404}) =>
      _ConfigRoute(routes, error404: error404);
}
