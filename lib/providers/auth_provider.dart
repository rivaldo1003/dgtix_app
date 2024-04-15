import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
import 'package:dgtix_app/domain/usecases/get_auth_use_case.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final GetAuthUseCase _getAuthUseCase;

  AuthProvider({required GetAuthUseCase getAuthUseCase})
      : _getAuthUseCase = getAuthUseCase {}

  String? _name;
  String? get name => _name;
  String? _email;
  String? get email => _email;

  bool _obscure = false;

  bool get obscure => _obscure;

  void showPassword() {
    _obscure = !obscure;
    notifyListeners();
  }

  void saveFullName(String name) async {
    await SharedPreferencesManager.instance.setName(name);
    _name = name;
    notifyListeners();
  }

  void loadName() async {
    _name = await SharedPreferencesManager.instance.getName();
    notifyListeners();
  }

  void saveEmail(String email) async {
    await SharedPreferencesManager.instance.setEmail(email);
    _email = email;
    notifyListeners();
  }

  void loadEmail() async {
    _email = await SharedPreferencesManager.instance.getEmail();
    notifyListeners();
  }
}
