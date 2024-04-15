import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/domain/usecases/get_ticket_use_case.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/card_event_component.dart';
import 'package:dgtix_app/presentation/widgets/textfield_component.dart';
import 'package:dgtix_app/providers/auth_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getTicketUseCase = Provider.of<GetTicketUseCase>(context);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Beranda',
        visibleLeading: true,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) {
                    if (authProvider.name == null) {
                      authProvider.loadName();
                      return CircularProgressIndicator();
                    } else {
                      return RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: AppFont.montserrat(
                                18,
                                FontWeight.w500,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            TextSpan(
                              text: '\n${authProvider.name}',
                              style: AppFont.montserrat(
                                18,
                                FontWeight.bold,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                SvgPicture.asset('assets/icons/app.svg'),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              thickness: 0.2,
            ),
            const SizedBox(height: 8),
            Text(
              'Temukan Acara',
              style: AppFont.montserrat(
                16,
                FontWeight.bold,
                color: AppColor.whiteColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFieldComponent(
              hintText: 'Cari acara',
              cursorColor: AppColor.secondaryColor,
              inputTextColor: AppColor.whiteColor,
              hintTextColor: AppColor.whiteColor,
              suffixIcon: SvgPicture.asset('assets/icons/filter.svg'),
              preffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
              filled: false,
              inputBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.whiteColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder(
                future: getTicketUseCase.execute(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error.toString()}'),
                    );
                  } else {
                    if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final Ticket ticket = snapshot.data![index];
                          return CardEventComponent(ticket: ticket);
                        },
                      );
                    } else {
                      // Tampilan jika data kosong
                      return Center(
                        child: Text('Data kosong'),
                      );
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
