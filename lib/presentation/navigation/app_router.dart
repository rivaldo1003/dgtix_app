import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/pages/account_screen.dart';
import 'package:dgtix_app/presentation/pages/bottom_navigation_page.dart';
import 'package:dgtix_app/presentation/pages/detail_event_screen.dart';
import 'package:dgtix_app/presentation/pages/detail_history_screen.dart';
import 'package:dgtix_app/presentation/pages/history_screen.dart';
import 'package:dgtix_app/presentation/pages/login_screen.dart';
import 'package:dgtix_app/presentation/pages/pay_screen.dart';
import 'package:dgtix_app/presentation/pages/register_screen.dart';
import 'package:dgtix_app/presentation/pages/success_payment_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: ((context) => LoginScreen()),
        );
      case Routes.detailEventScreen:
        final args = settings.arguments;
        if (args is Ticket) {
          return MaterialPageRoute(
            builder: ((context) => DetailEventScreen(
                  ticket: args,
                )),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  'Page not found',
                  style: AppFont.montserrat(
                    16,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: ((context) => RegisterScreen()),
        );
      case Routes.payScreen:
        final args = settings.arguments;
        if (args is Ticket) {
          return MaterialPageRoute(
            builder: ((context) => PayScreen(
                  ticket: args,
                )),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  'Page not found',
                  style: AppFont.montserrat(
                    16,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      case Routes.successPaymentScreen:
        return MaterialPageRoute(
          builder: ((context) => SuccessPaymentScreen()),
        );
      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: ((context) => BottomNavigationPage()),
        );
      case Routes.historyScreen:
        return MaterialPageRoute(
          builder: ((context) => HistoryScreen()),
        );
      case Routes.detailHistoryScreen:
        final args = settings.arguments;
        if (args is Ticket) {
          return MaterialPageRoute(
            builder: ((context) => DetailHistoryScreen(
                  ticket: args,
                )),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  'Page not found',
                  style: AppFont.montserrat(
                    16,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      case Routes.accountScreen:
        return MaterialPageRoute(
          builder: ((context) => AccountScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'Page not found',
                style: AppFont.montserrat(
                  16,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        );
    }
  }
}
