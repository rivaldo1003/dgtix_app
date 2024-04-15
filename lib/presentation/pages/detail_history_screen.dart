import 'dart:io';

import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/detail_item_ticket_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailHistoryScreen extends StatelessWidget {
  final Ticket? ticket;

  const DetailHistoryScreen({super.key, this.ticket});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBarComponent(title: 'Detail Tiket'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg_card.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  ' ticket.title',
                                  textAlign: TextAlign.center,
                                  style: AppFont.montserrat(
                                    16,
                                    FontWeight.bold,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ticket.place',
                                  textAlign: TextAlign.center,
                                  style: AppFont.montserrat(
                                    14,
                                    FontWeight.w500,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                                Text(
                                  ' ticket.date',
                                  textAlign: TextAlign.center,
                                  style: AppFont.montserrat(
                                    14,
                                    FontWeight.w500,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailItemTicketHistory(
                                label: 'Nama Lengkap',
                                output: 'Rivaldo Siregar',
                              ),
                              DetailItemTicketHistory(
                                label: 'Umur',
                                output: '21 Tahun',
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailItemTicketHistory(
                                label: 'Email',
                                output: 'rvldsiregar@gmail.com',
                              ),
                              DetailItemTicketHistory(
                                label: 'Status Tiket',
                                status: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.greenTicketStatus,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Aktif',
                                      style: AppFont.montserrat(
                                        12,
                                        FontWeight.bold,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailItemTicketHistory(
                                label: 'ID Pembelian',
                                output: '46434G475GBVV454485',
                              ),
                              SizedBox(height: 16),
                              DetailItemTicketHistory(
                                label: 'Ukuran Baju',
                                output: 'S',
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          DetailItemTicketHistory(
                              label: 'Tanggal Order', output: ''
                              // (dateTimeConvert(ticket.timeOrder!.toLocal()) +
                              //     ' WIB'),
                              ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: List.generate(
                                150 ~/ 3,
                                (index) => Expanded(
                                      child: Container(
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : AppColor.greyBright,
                                        height: 2,
                                      ),
                                    )),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: QrImageView(
                        data: 'https://gsjasungaikehidupan.com',
                        version: QrVersions.auto,
                        size: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonComponent(
                title: 'Unduh Tiket',
                backgroundColor: AppColor.secondaryColor,
                titleColor: AppColor.primaryColor,
                onPressed: () {
                  unduhTikcetPDF();
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> unduhTikcetPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
