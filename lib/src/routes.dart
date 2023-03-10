import 'package:flutter/material.dart';
import 'package:knuffiworkout/src/main_screen.dart';
import 'package:knuffiworkout/src/workout/edit_screen.dart';

/// App routes (entirely different screens).
class AppRouteItem {
  AppRouteItem({@required this.path, this.buildWidget, this.pathParser});

  /// Path for the route.
  final String path;

  /// Direct [WidgetBuilder] if no path parsing is necessary.
  final WidgetBuilder buildWidget;

  /// Parses the given path segments and returns a [WidgetBuilder] for this
  /// path.
  final WidgetBuilder Function(List<String> pathSegments) pathParser;

  /// Navigates to this route.
  ///
  /// Additional parameters can be passed to this route using [pathSegments].
  void navigateTo(BuildContext context, {List<String> pathSegments}) {
    var resultPath = path;
    if (pathSegments != null && pathSegments.isNotEmpty) {
      resultPath = '$path/${pathSegments.join("/")}';
    }
    Navigator.of(context).pushNamed(resultPath);
  }
}

/// The main screen of the app.
///
/// This screen contains most of the app content in subviews that are managed
/// independently of the app routing mechanism (see [MainScreen]).
final mainScreen = AppRouteItem(
    path: '/', buildWidget: (BuildContext context) => MainScreen());

/// Screen in the app for editing a workout after the fact.
final editScreen = AppRouteItem(
    path: '/edit',
    pathParser: (List<String> pathSegments) {
      assert(pathSegments.length == 1);
      final key = pathSegments.first;
      return (BuildContext context) => EditScreen(key);
    });

/// All routes that are directly mapped and do not have complex path parsing.
final directMappedRoutes = [mainScreen];
