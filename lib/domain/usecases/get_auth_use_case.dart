import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/domain/repositories/auth_repository.dart';

class GetAuthUseCase {
  final AuthRepository authRepository;

  GetAuthUseCase({required this.authRepository});

  Future<Map<String, dynamic>> login(
    Map<String, dynamic> body,
  ) async {
    try {
      return await authRepository.login(body);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      return await authRepository.register(body);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> logout() async {
    try {
      return await authRepository.logout();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
