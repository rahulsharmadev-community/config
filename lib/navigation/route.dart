part of '../config.dart';

MaterialPageRoute<dynamic> buildMaterialPageRoute(
        child, RouteSettings settings) =>
    MaterialPageRoute(builder: (_) => child, settings: settings);

class _ConfigRoute {
  /// When Page not found
  final Widget? error404;
  final Map<String, Widget> routes;
  _ConfigRoute(this.routes, {this.error404});

  MaterialPageRoute<dynamic> onGenerater(RouteSettings settings) =>
      buildMaterialPageRoute(
          routes.entries
              .firstWhere((element) => element.key == settings.name,
                  orElse: () =>
                      MapEntry('Unknown', error404 ?? defaultError404))
              .value,
          settings);

  Center get defaultError404 => const Center(
      child:
          DefaultTextStyle(style: TextStyle(), child: Text('Page Not Found')));
}
