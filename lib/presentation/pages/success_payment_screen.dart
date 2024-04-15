import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:flutter/material.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.png'),
            Text(
              'Selamat!',
              style: AppFont.montserrat(
                36,
                FontWeight.bold,
                color: AppColor.whiteColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Kamu berhasil membeli tiket: ',
              style: AppFont.montserrat(
                14,
                FontWeight.w500,
                color: AppColor.greyColor,
              ),
            ),
            Text(
              'Diamond Conference IV 2024',
              style: AppFont.montserrat(
                16,
                FontWeight.bold,
                color: AppColor.whiteColor,
              ),
            ),
            SizedBox(height: 16),
            ButtonComponent(
              title: 'Lihat Tiket',
              backgroundColor: AppColor.secondaryColor,
              titleColor: AppColor.primaryColor,
              onPressed: () {
                NavigationService().pushAndRemoveUntil(Routes.bottomNavigation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
