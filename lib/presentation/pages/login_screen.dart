import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
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
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  void dispose() {
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
              key: _keyForm,
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
                          "Masuk",
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
                                controller: _emailController,
                                hintText: 'Email',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email tidak boleh kosong';
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
                                onTap: () {
                                  authProvider.showPassword();
                                },
                                controller: _passwordController,
                                hintText: 'Password',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  } else {}
                                },
                                suffixIcon: (authProvider.obscure)
                                    ? SvgPicture.asset(
                                        'assets/icons/password.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/password.svg',
                                        color: AppColor.primaryColor,
                                      ),
                              ),
                              const SizedBox(height: 24),
                              ButtonComponent(
                                onPressed: () {
                                  if (_keyForm.currentState!.validate()) {
                                    getAuthUseCase.login({
                                      'email': _emailController.text,
                                      'password': _passwordController.text,
                                    }).then((value) {
                                      if (value['success']) {
                                        SharedPreferencesManager.instance
                                            .setToken(value['token']);
                                        authProvider.saveFullName(
                                            value['user']['name']);
                                        authProvider
                                            .saveEmail(value['user']['email']);

                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        Future.delayed(Duration(seconds: 3),
                                            () {
                                          NavigationService().navigateTo(
                                              Routes.bottomNavigation);
                                        });
                                      } else {}
                                    });
                                  }
                                },
                                title: 'Masuk',
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
                        'Belum punya akun?',
                        style: AppFont.montserrat(
                          12,
                          FontWeight.w500,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationService().navigateTo(Routes.registerScreen);
                        },
                        child: Text(
                          ' Daftar',
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
