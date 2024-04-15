import 'dart:convert';
import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/core/utils/shared_preferences_manager.dart';
import 'package:dgtix_app/core/utils/url.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client httpClient;

  ApiClient({
    required this.httpClient,
  });

  // GET ALL EVENT
  Future<http.Response> fetchTicket() async {
    final String url = UrlApi.event;
    try {
      final token = await SharedPreferencesManager.instance.getToken();
      if (token == null) {
        throw ServerException(message: 'Token is null');
      }
      print('Token : $token');
      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException(message: 'Failed to load events');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to fetch ticket: $e');
    }
  }

  // LOGIN API
  Future<http.Response> login(
    Map<String, dynamic> body,
  ) async {
    final url = Uri.parse(UrlApi.login);

    try {
      var headers = {
        "Content-Type": "application/json",
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException(message: 'Failed to login');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to login: $e');
    }
  }

  // REGISTER API
  Future<http.Response> register(
    Map<String, dynamic> body,
  ) async {
    final url = Uri.parse(UrlApi.register);
    try {
      var headers = {
        "Content-Type": "application/json",
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        throw ServerException(message: 'Failed to register');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to register: $e');
    }
  }

  Future<http.Response> logout() async {
    final url = Uri.parse(UrlApi.logout);
    try {
      final token = await SharedPreferencesManager.instance.getToken();
      if (token == null) {
        throw ServerException(message: 'Token is null');
      }
      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await http.delete(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        throw ServerException(message: 'Failed to logout');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to logout: $e');
    }
  }
}
