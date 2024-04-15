import 'package:barcode/barcode.dart';
import 'package:dgtix_app/di/service_loader/service_loader.dart';
import 'package:dgtix_app/presentation/navigation/app_router.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/pages/bottom_navigation_page.dart';
import 'package:dgtix_app/presentation/pages/login_screen.dart';
import 'package:dgtix_app/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        apiClientProvider,
        ticketRemoteDataSourceProvider,
        ticketRepositoryProvider,
        getTicketUsecaseProvider,
        ticketProvider,
        authRemoteDataSourceProvider,
        authRepositoryProvider,
        getAuthUseCaseProvider,
        authProvider,
        historyProvider,
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        navigatorKey: NavigationService().navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
