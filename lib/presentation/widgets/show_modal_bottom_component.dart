import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/textfield_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ShowModalBottomComponent extends StatefulWidget {
  final Function(String) onApplyPromo;

  const ShowModalBottomComponent({
    super.key,
    required this.onApplyPromo,
  });

  @override
  _ShowModalBottomComponentState createState() =>
      _ShowModalBottomComponentState();
}

class _ShowModalBottomComponentState extends State<ShowModalBottomComponent> {
  bool _isKeyboardVisible = false;
  bool _isSelectedPromo = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mediaQueryData = MediaQuery.of(context);
      setState(() {
        _isKeyboardVisible = mediaQueryData.viewInsets.bottom > 0;
      });
    });
  }

  TextEditingController _promoController = TextEditingController();
  String promoEvent = 'DCIV';

  void _onApplyPromo() {
    if (_promoController.text == promoEvent) {
      widget.onApplyPromo(promoEvent);
      print('Promo berhasil dipakai');
      NavigationService().goBack();
    } else {
      print('Promo tidak ditemukan');
    }
  }

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: _isKeyboardVisible
            ? MediaQuery.of(context).size.height * 0.50
            : null,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColor.greyBright,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 20,
              ),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gunakan Promo",
                          style: AppFont.montserrat(
                            18,
                            FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigationService().goBack();
                          },
                          child: SvgPicture.asset('assets/icons/exit.svg'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      thickness: 0.5,
                    ),
                    SizedBox(height: 24),
                    TextFieldComponent(
                      controller: _promoController,
                      hintText: 'Masukkan kode promo',
                      suffixIcon: null,
                      filled: false,
                      validator: (value) {
                        if (_promoController.text != promoEvent) {
                          return 'Kode promo tidak ditemukan';
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Kode promo berhasil dipakai',
                                style: AppFont.montserrat(
                                  14,
                                  FontWeight.w500,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              backgroundColor: AppColor.greenTicketStatus,
                            ),
                          );
                        }
                      },
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColor.greyStroke,
                          width: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelectedPromo = !_isSelectedPromo;
                          print(_isSelectedPromo);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (_isSelectedPromo == false)
                              ? null
                              : AppColor.secondaryColor,
                          border: Border.all(
                            color: AppColor.greyStroke,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '20% off ticket purchase',
                                  style: AppFont.montserrat(
                                    16,
                                    FontWeight.bold,
                                    color: (_isSelectedPromo == false)
                                        ? AppColor.blackColor
                                        : AppColor.whiteColor,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.blueColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Spesial',
                                      style: AppFont.montserrat(
                                        12,
                                        FontWeight.bold,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/dot.svg'),
                                Text(
                                  '15% OFF Your Next Purchase',
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.w500,
                                    color: (_isSelectedPromo == false)
                                        ? AppColor.greyColor
                                        : AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/dot.svg'),
                                Text(
                                  'Earn 50 Bonus Points',
                                  style: AppFont.montserrat(
                                    12,
                                    FontWeight.w500,
                                    color: (_isSelectedPromo == false)
                                        ? AppColor.greyColor
                                        : AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.greyContainerPromo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Turpis vitae lectus mattis duis nunc.',
                                style: AppFont.montserrat(
                                  12,
                                  FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ButtonComponent(
                      title: 'Pakai',
                      backgroundColor: AppColor.secondaryColor,
                      titleColor: AppColor.primaryColor,
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          _onApplyPromo();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
