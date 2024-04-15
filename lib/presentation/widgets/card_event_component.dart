import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/date_time_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CardEventComponent extends StatelessWidget {
  final Ticket ticket;

  const CardEventComponent({
    super.key,
    required this.ticket,
  });
  @override
  Widget build(BuildContext context) {
    var timeOutput = ticket.eventSchedule.toString();
    var outputDate = dateTimeConvert(DateTime.parse(timeOutput));
    print('Output Date : ${outputDate}');
    var price = int.parse(ticket.price.toString().replaceAll('.', ''));
    var totalPrice = NumberFormat.decimalPattern('id').format(price);

    return Container(
      // height: 194,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          // splashColor: AppColor.orangeColor,
          onTap: () {
            NavigationService()
                .navigateTo(Routes.detailEventScreen, arguments: ticket);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: AppColor.blackColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_card.jpg'),
                      opacity: 0.7,
                      fit: BoxFit.cover,
                    )),
                child: Row(
                  children: [
                    Container(
                      height: 38,
                      width: 6,
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ticket.eventName,
                              style: AppFont.montserrat(
                                18,
                                FontWeight.bold,
                                color: AppColor.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                  right: 20,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/time.svg'),
                            SizedBox(width: 8),
                            Text(
                              outputDate,
                              style: AppFont.montserrat(
                                12,
                                FontWeight.w500,
                                color: AppColor.greyColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            SizedBox(width: 8),
                            Text(
                              ticket.eventPlace,
                              style: AppFont.montserrat(
                                12,
                                FontWeight.w500,
                                color: AppColor.greyColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColor.greyTextField,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  ' ${ticket.availableTicket}',
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                Text(
                                  ' / ${ticket.quotaEvent} Tersedia',
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.w500,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Rp${totalPrice}',
                              style: AppFont.montserrat(
                                16,
                                FontWeight.bold,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            Text(
                              ' /orang',
                              style: AppFont.montserrat(
                                12,
                                FontWeight.w500,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
