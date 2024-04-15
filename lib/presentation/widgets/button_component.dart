import 'package:dgtix_app/core/utils/font.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Function() onPressed;

  const ButtonComponent({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFont.montserrat(
            14,
            FontWeight.bold,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
