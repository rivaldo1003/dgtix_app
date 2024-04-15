import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/detail_payment_item.dart';
import 'package:dgtix_app/presentation/widgets/show_modal_bottom_component.dart';
import 'package:dgtix_app/providers/history_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PayScreen extends StatefulWidget {
  final Ticket ticket;

  const PayScreen({super.key, required this.ticket});
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String promo = '';
  int promoDiscount = 0;

  @override
  Widget build(BuildContext context) {
    var serviceFee = 2000;
    var price = int.parse(widget.ticket.price.toString().replaceAll('.', ''));
    var priceTotal = NumberFormat.decimalPattern('id').format(price);
    var totalAmount = price + serviceFee - promoDiscount; // Update total amount
    var totalPrice = NumberFormat.decimalPattern('id').format(totalAmount);

    DateTime dateTime = DateTime.parse(widget.ticket.eventSchedule);
    var formattedDate = DateFormat('EEEE, dd MMMM yyyy', 'id').format(dateTime);
    final historyProvider = Provider.of<HistoryProvider>(context);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Bayar',
      ),
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.ticket.eventName,
                    style: AppFont.montserrat(
                      20,
                      FontWeight.bold,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              Text(
                formattedDate,
                style: AppFont.montserrat(
                  14,
                  FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.ticket.eventPlace,
                style: AppFont.montserrat(
                  14,
                  FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              const SizedBox(height: 16),
              DetailPaymentItem(label: 'Tiket (x1)', price: 'Rp${priceTotal}'),
              const SizedBox(height: 12),
              DetailPaymentItem(label: 'Biaya Layanan', price: 'Rp2.000'),
              const SizedBox(height: 12),
              DetailPaymentItem(
                label: (promo == '') ? 'Gunakan Promo' : promo,
                icon: SvgPicture.asset(
                  'assets/icons/price.svg',
                  color: AppColor.secondaryColor,
                ),
                labelColor: AppColor.greyColor,
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ShowModalBottomComponent(
                        onApplyPromo: (promoCode) {
                          setState(() {
                            promo = promoCode;
                            promoDiscount = 50000;
                            print('Promo : ${promo}');
                          });
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  (promo != '')
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  promo = '';
                                  promoDiscount = 0;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColor.redLogout,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/exit.svg',
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Potongan Harga ($promo) -Rp$promoDiscount',
                              style: AppFont.montserrat(
                                12,
                                FontWeight.w500,
                                color: AppColor.greyColor,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bg_note.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note',
                      style: AppFont.montserrat(
                        14,
                        FontWeight.bold,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/money.svg'),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Turpis vitae lectus mattis duis nunc.',
                            style: AppFont.montserrat(
                              12,
                              FontWeight.w500,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          border: Border(
            top: BorderSide(
              color: AppColor.greyColor,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Total',
                      style: AppFont.montserrat(
                        14,
                        FontWeight.w500,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Text(
                      ' Rp${totalPrice}',
                      style: AppFont.montserrat(
                        18,
                        FontWeight.bold,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Detail',
                      style: AppFont.montserrat(
                        14,
                        FontWeight.w500,
                        color: AppColor.greyColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/detail.svg'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ButtonComponent(
              title: 'Bayar',
              backgroundColor: AppColor.secondaryColor,
              titleColor: AppColor.primaryColor,
              onPressed: () {
                var ticket = Ticket(
                  id: widget.ticket.id,
                  eventName: widget.ticket.eventName,
                  eventPlace: widget.ticket.eventPlace,
                  eventSchedule: widget.ticket.eventSchedule,
                  availableTicket: widget.ticket.availableTicket,
                  quotaEvent: widget.ticket.quotaEvent,
                  price: widget.ticket.price,
                  eventDescription: widget.ticket.eventDescription,
                );
                historyProvider.addTicketToHistory(ticket);
              },
            ),
          ],
        ),
      ),
    );
  }
}
