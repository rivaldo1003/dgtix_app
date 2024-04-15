import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
import 'package:dgtix_app/domain/usecases/get_auth_use_case.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/app_bar_component.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/detail_item_profile.dart';
import 'package:dgtix_app/presentation/widgets/loading_component.dart';
import 'package:dgtix_app/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void checkAllValuesInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Ambil semua kunci yang tersimpan
    Set<String> keys = prefs.getKeys();

    // Iterasi melalui setiap kunci dan cetak nilainya
    keys.forEach((key) {
      dynamic value = prefs.get(key);
      print('Key: $key, Value: $value');
    });
  }

  @override
  void initState() {
    checkAllValuesInSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getAuthUseCase = Provider.of<GetAuthUseCase>(context);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Account',
        visibleLeading: true,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, _) {
                        if (authProvider.name == null ||
                            authProvider.email == null) {
                          authProvider.loadName();
                          authProvider.loadEmail();
                          return CircularProgressIndicator();
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.whiteColor,
                                    ),
                                    color: AppColor.greyBright,
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/person.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  authProvider.name!,
                                  style: AppFont.montserrat(
                                    18,
                                    FontWeight.bold,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                                Text(
                                  authProvider.email!,
                                  style: AppFont.montserrat(
                                    13,
                                    FontWeight.w500,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Profil',
                            style: AppFont.montserrat(
                              14,
                              FontWeight.bold,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const DetailItemProfile(
                            icon: 'assets/icons/manage_account.svg',
                            label: 'Kelola Akun',
                            circleColor: AppColor.bgCircleManageAccount,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Pengaturan',
                            style: AppFont.montserrat(
                              14,
                              FontWeight.bold,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const DetailItemProfile(
                            icon: 'assets/icons/notification.svg',
                            label: 'Notifikasi',
                            circleColor: AppColor.bgCirleNotification,
                          ),
                          const SizedBox(height: 16),
                          const DetailItemProfile(
                            icon: 'assets/icons/dark_mode.svg',
                            label: 'Dark Mode',
                            circleColor: AppColor.bgCirleDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonComponent(
              title: 'Keluar',
              backgroundColor: AppColor.redLogout,
              titleColor: AppColor.whiteColor,
              onPressed: () {
                getAuthUseCase.logout().then((value) {
                  print('value : $value');
                  if (value['success']) {
                    SharedPreferencesManager.instance.deleteAll();
                    loading(context);
                    Future.delayed(Duration(seconds: 3), () {
                      NavigationService()
                          .pushAndRemoveUntil(Routes.loginScreen);
                    });
                  } else {}
                });
                checkAllValuesInSharedPreferences();
              },
            ),
          ),
        ],
      ),
    );
  }
}
