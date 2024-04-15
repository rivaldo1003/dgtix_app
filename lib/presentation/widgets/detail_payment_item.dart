import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:flutter/material.dart';

class DetailPaymentItem extends StatelessWidget {
  String? label;
  String? price;
  Widget? icon;
  void Function()? onTap;
  Color? labelColor;

  DetailPaymentItem({
    super.key,
    this.label,
    this.price,
    this.icon,
    this.onTap,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: (label == 'Gunakan Promo') ? AppColor.whiteColor : null,
          border: (label == 'Gunakan Promo')
              ? null
              : Border.all(
                  color: AppColor.greyTextPaymentPage,
                ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label ?? '',
              style: AppFont.montserrat(14, FontWeight.w500,
                  color: labelColor ?? AppColor.greyTextPaymentPage),
            ),
            price != null
                ? Text(
                    price ?? '',
                    style: AppFont.montserrat(
                      14,
                      FontWeight.w500,
                      color: AppColor.greyTextPaymentPage,
                    ),
                  )
                : icon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
