part of '../config.dart';

class _ConfigNavigatorObserver extends NavigatorObserver {
  bool _isEnableLog = true;
  bool _isRouteLocation = true;
  bool _isOperation = false;
  bool _isAttributes = false;
  bool _isTime = false;

  void get disableLog => _isEnableLog = false;
  void get disableRouteLocation => _isRouteLocation = false;
  void get enableOperation => _isOperation = true;
  void get enableAttributes => _isAttributes = true;
  void get showTime => _isTime = true;

  List<String?> _routeHistory = [];

  void _printRouteHistory(
      String operation, RouteSettings? newRoute, RouteSettings? previousRoute) {
    String text = '';

    if (_isRouteLocation)
      text +=
          'Route Location: /${_routeHistory.toString().replaceAll(RegExp(r',|\]|\['), '')}';

    if (_isOperation) text += '\nOperation: $operation';
    if (_isAttributes)
      text +=
          '${newRoute != null ? '\nNewRoute: ${newRoute.name ?? 'UnknownRoute'}(${newRoute.arguments ?? ''})' : '\nNewRoute: Route Not Exist'}'
          '${previousRoute != null ? '\nPreviousRoute: ${previousRoute.name ?? 'UnknownRoute'}(${previousRoute.arguments ?? ''})' : '\nPreviousRoute: Route Not Exist'}';
    printLog(text, isTime: _isTime);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    var setting = (route.settings.name == '/'
        ? RouteSettings(name: 'RouteNotFound')
        : route.settings);
    _routeHistory.add(setting.name);
    if (_isEnableLog)
      _printRouteHistory('didPush', setting, previousRoute?.settings);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeHistory.removeLast();
    if (_isEnableLog)
      _printRouteHistory('didPop', route.settings, previousRoute?.settings);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeHistory.remove(route.settings.name);
    if (_isEnableLog)
      _printRouteHistory('didRemove', route.settings, previousRoute?.settings);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final olderIndex = _routeHistory.indexOf(oldRoute!.settings.name);
    _routeHistory
        .replaceRange(olderIndex, olderIndex + 1, [newRoute!.settings.name]);
    if (_isEnableLog)
      _printRouteHistory('didReplace', newRoute.settings, oldRoute.settings);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      printLog('didStartUserGesture: ${route}, '
          'previousRoute= ${previousRoute}');

  @override
  void didStopUserGesture() => printLog('didStopUserGesture');
}
