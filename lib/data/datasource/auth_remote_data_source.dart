import 'dart:convert';

import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/core/utils/api_client.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(
    Map<String, dynamic> body,
  );
  Future<Map<String, dynamic>> register(
    Map<String, dynamic> body,
  );
  Future<Map<String, dynamic>> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(
    this.apiClient,
  );
  @override
  Future<Map<String, dynamic>> login(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await apiClient.login(body);
      final responseData = json.decode(response.body);
      return responseData;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await apiClient.register(body);
      final responseData = json.decode(response.body);
      return responseData;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    final response = await apiClient.logout();
    final responseData = json.decode(response.body);
    return responseData;
  }
}
