import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/date_time_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DetailEventScreen extends StatelessWidget {
  final Ticket? ticket;

  const DetailEventScreen({super.key, this.ticket});
  @override
  Widget build(BuildContext context) {
    var timeOutput = ticket!.eventSchedule.toString();
    var outputDate = dateTimeConvert(DateTime.parse(timeOutput));
    print('Output Date : ${outputDate}');
    var price = int.parse(ticket!.price.toString().replaceAll('.', ''));
    var totalPrice = NumberFormat.decimalPattern('id').format(price);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Detail Acara',
      ),
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 38,
                    width: 6,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ticket!.eventName,
                            style: AppFont.montserrat(
                              20,
                              FontWeight.bold,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
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
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            SizedBox(width: 8),
                            Text(
                              ticket!.eventPlace,
                              style: AppFont.montserrat(
                                12,
                                FontWeight.w500,
                                color: AppColor.greyColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.2,
                height: 0,
                color: AppColor.greyTextField,
              ),
              SizedBox(height: 16),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: AppFont.montserrat(
                        20,
                        FontWeight.bold,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: ticket!.eventDescription,
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.w500,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' more...',
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.bold,
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Divider(
                thickness: 0.2,
                height: 0,
                color: AppColor.greyTextField,
              ),
              SizedBox(height: 16),
              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Jadwal Acara',
              //         style: AppFont.montserrat(
              //           20,
              //           FontWeight.bold,
              //           color: AppColor.whiteColor,
              //         ),
              //       ),
              //       SizedBox(height: 8),
              //       Text(
              //         ticket!.descriptionEvent,
              //         style: AppFont.montserrat(
              //           13,
              //           FontWeight.w500,
              //           color: AppColor.whiteColor,
              //         ),
              //       ),
              //       SizedBox(height: 4),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: RichText(
              //               text: TextSpan(
              //                 children: [
              //                   TextSpan(
              //                     text: 'ticket.eventSchedule!.description',
              //                     style: AppFont.montserrat(
              //                       12,
              //                       FontWeight.w500,
              //                       color: AppColor.greyColor,
              //                     ),
              //                   ),
              //                   TextSpan(
              //                     text: ' more...',
              //                     style: AppFont.montserrat(
              //                       12,
              //                       FontWeight.bold,
              //                       color: AppColor.secondaryColor,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(height: 160),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp${totalPrice}',
                  style: AppFont.montserrat(
                    20,
                    FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                Text(
                  "/ Orang",
                  style: AppFont.montserrat(
                    12,
                    FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' ${ticket!.availableTicket}',
                      style: AppFont.montserrat(
                        12,
                        FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Text(
                      ' / ${ticket!.quotaEvent} Tiket tersedia',
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
            SizedBox(height: 8),
            ButtonComponent(
              onPressed: () {
                NavigationService()
                    .navigateTo(Routes.payScreen, arguments: ticket);
              },
              title: 'Beli Tiket',
              backgroundColor: AppColor.secondaryColor,
              titleColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
