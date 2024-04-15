import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:flutter/cupertino.dart';

class DetailItemTicketHistory extends StatelessWidget {
  String? label;
  String? output;
  Widget? status;

  DetailItemTicketHistory({
    super.key,
    this.label,
    this.output,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          textAlign: TextAlign.center,
          style: AppFont.montserrat(
            10,
            FontWeight.w500,
            color: AppColor.greyColor,
          ),
        ),
        status ??
            Text(
              output ?? '',
              textAlign: TextAlign.center,
              style: AppFont.montserrat(
                12,
                FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ),
      ],
    );
  }
}
