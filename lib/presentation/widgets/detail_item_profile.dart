import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailItemProfile extends StatelessWidget {
  final String icon;
  final String label;
  final Color circleColor;

  const DetailItemProfile({
    super.key,
    required this.icon,
    required this.label,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.greenBright,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.greyStroke),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          SizedBox(width: 16),
          Text(
            label,
            style: AppFont.montserrat(
              12,
              FontWeight.w600,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
