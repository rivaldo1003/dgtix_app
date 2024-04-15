import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void pushAndRemoveUntil(String newRouteName, {dynamic arguments}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        newRouteName, (route) => false,
        arguments: arguments);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
