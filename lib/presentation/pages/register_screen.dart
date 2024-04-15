import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/di/service_loader/service_loader.dart';
import 'package:dgtix_app/domain/usecases/get_auth_use_case.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:dgtix_app/presentation/widgets/button_component.dart';
import 'package:dgtix_app/presentation/widgets/textfield_component.dart';
import 'package:dgtix_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getAuthUseCase = Provider.of<GetAuthUseCase>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.greyTextField.withOpacity(0.02),
                          AppColor.greyTextField.withOpacity(0.4),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Daftar",
                          style: AppFont.montserrat(
                            20,
                            FontWeight.bold,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        Text(
                          "Senang bertemu denganmu lagi.",
                          style: AppFont.montserrat(
                            12,
                            FontWeight.w500,
                            color: AppColor.greyColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextFieldComponent(
                                controller: _nameController,
                                hintText: 'Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Bidang nama tidak boleh kosong';
                                  }
                                },
                                suffixIcon: SvgPicture.asset(
                                  'assets/icons/name.svg',
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFieldComponent(
                                controller: _emailController,
                                hintText: 'Email',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Bidang email tidak boleh kosong';
                                  } else {
                                    if (GetUtils.isEmail(value)) {
                                      return null;
                                    } else {
                                      return 'Masukkan email yang valid';
                                    }
                                  }
                                },
                                suffixIcon: SvgPicture.asset(
                                  'assets/icons/email.svg',
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFieldComponent(
                                obscureText:
                                    (authProvider.obscure) ? true : false,
                                controller: _passwordController,
                                hintText: 'Password',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Bidang password tidak boleh kosong';
                                  } else {
                                    if (value.length >= 6) {
                                      return null;
                                    } else {
                                      return 'Password minimal 6 karakter';
                                    }
                                  }
                                },
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    authProvider.showPassword();
                                  },
                                  child: (authProvider.obscure)
                                      ? SvgPicture.asset(
                                          'assets/icons/password.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/password.svg',
                                          color: AppColor.primaryColor,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              ButtonComponent(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    getAuthUseCase.register(
                                      {
                                        'name': _nameController.text,
                                        'email': _emailController.text,
                                        'password': _passwordController.text,
                                      },
                                    ).then((value) {
                                      print(value);
                                      if (value['success']) {
                                        NavigationService()
                                            .navigateTo(Routes.loginScreen);
                                        Get.snackbar(
                                          backgroundColor: AppColor.greenBright,
                                          'title',
                                          'Pendaftaran berhasil. Silahkan masuk.',
                                          titleText: Text(
                                            'Pendaftaran Berhasil',
                                            style: AppFont.montserrat(
                                              14,
                                              FontWeight.bold,
                                              color: AppColor.greenTicketStatus,
                                            ),
                                          ),
                                          messageText: Text(
                                            'Pendaftaran berhasil. Silahkan masuk.',
                                            style: AppFont.montserrat(
                                              12,
                                              FontWeight.w500,
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                        );
                                      } else {
                                        Get.snackbar('Pendaftaran Gagal',
                                            'Email sudah terdaftar. Gunakan email lain');
                                      }
                                    });
                                  }
                                },
                                title: 'Daftar',
                                backgroundColor: AppColor.secondaryColor,
                                titleColor: AppColor.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: AppFont.montserrat(
                          12,
                          FontWeight.w500,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationService().navigateTo(Routes.loginScreen);
                        },
                        child: Text(
                          ' Masuk',
                          style: AppFont.montserrat(
                            12,
                            FontWeight.bold,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
