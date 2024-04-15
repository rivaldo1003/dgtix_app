import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String? token;

class _SplashScreenState extends State<SplashScreen> {
  Future _getStart() async {
    token = await SharedPreferencesManager.instance.getToken();
    Future.delayed(Duration(seconds: 2), () {
      if (token!.isEmpty || token == null) {
        NavigationService().navigateTo(Routes.loginScreen);
      } else {
        NavigationService().navigateTo(Routes.bottomNavigation);
      }
    });
  }

  @override
  void initState() {
    _getStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Shimmer.fromColors(
                baseColor: AppColor.whiteColor, // Warna latar belakang shimmer
                highlightColor: AppColor.greyColor,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
