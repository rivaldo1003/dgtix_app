import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBarComponent(title: 'Scan Screen'),
      body: Center(),
    );
  }
}
