import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/data/datasource/auth_remote_data_source.dart';
import 'package:dgtix_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Map<String, dynamic>> login(
    Map<String, dynamic> body,
  ) async {
    try {
      return await authRemoteDataSource.login(body);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      return await authRemoteDataSource.register(body);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    try {
      return await authRemoteDataSource.logout();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
