import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:flutter/material.dart';

class CardTicketHistory extends StatelessWidget {
  final Ticket ticket;

  const CardTicketHistory({super.key, required this.ticket});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
            right: 20,
            bottom: 0,
          ),
          child: Text(
            'dateTimeConvert(DateTime.parse(ticket.timeOrder.toString()))',
            style: AppFont.montserrat(
              12,
              FontWeight.bold,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.greenBackgroundCardHistory,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'ticket.title',
                      style: AppFont.montserrat(
                        16,
                        FontWeight.bold,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/success.png',
                    height: 24,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    ' ticket.place',
                    style: AppFont.montserrat(
                      12,
                      FontWeight.w500,
                      color: AppColor.greyColor,
                    ),
                  ),
                  Text(
                    ' | Rp${'ticket.price'}',
                    style: AppFont.montserrat(
                      12,
                      FontWeight.bold,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                ' ${'ticket.date'}',
                style: AppFont.montserrat(
                  12,
                  FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              Text(
                ' Tiket (x1)',
                style: AppFont.montserrat(
                  12,
                  FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              Text(
                ('ticket.promoCode' == null)
                    ? ''
                    : ' Promo ${'ticket.promoCode'}',
                style: AppFont.montserrat(
                  12,
                  FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              SizedBox(height: 16),
              ButtonComponent(
                title: 'Detail Tiket',
                backgroundColor: AppColor.secondaryColor,
                titleColor: AppColor.primaryColor,
                onPressed: () {
                  NavigationService().navigateTo(Routes.detailHistoryScreen,
                      arguments: 'ticket');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
