import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool? visibleLeading;

  AppBarComponent({
    super.key,
    required this.title,
    this.visibleLeading,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      leading: visibleLeading == null
          ? GestureDetector(
              onTap: () {
                NavigationService().goBack();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.whiteColor,
              ),
            )
          : SizedBox(),
      title: Text(
        title,
        style: AppFont.montserrat(
          16,
          FontWeight.bold,
          color: AppColor.whiteColor,
        ),
      ),
    );
  }
}
