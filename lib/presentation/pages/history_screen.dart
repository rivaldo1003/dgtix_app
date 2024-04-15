import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/card_ticket_history_component.dart';
import 'package:dgtix_app/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Riwayat',
        visibleLeading: true,
      ),
      backgroundColor: AppColor.primaryColor,
      body: (historyProvider.histories.isEmpty)
          ? Center(
              child: Text(
                'Ada belum memiliki tiket apapun.',
                style: AppFont.montserrat(
                  14,
                  FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
              ),
            )
          : ListView.separated(
              itemCount: historyProvider.histories.length,
              itemBuilder: (context, index) {
                var ticket = historyProvider.histories[index];
                return CardTicketHistory(
                  ticket: ticket,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.2,
                  color: AppColor.greyBright,
                );
              },
            ),
    );
  }
}
