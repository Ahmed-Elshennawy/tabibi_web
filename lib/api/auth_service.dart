import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabibi_web/api/errors/errors.dart';

class AuthService {
  final Dio _dio;
  final String baseUrl = "https://neatly-rare-aardvark.ngrok-free.app";

  AuthService()
      : _dio = Dio(BaseOptions(
          baseUrl: "https://neatly-rare-aardvark.ngrok-free.app",
          connectTimeout: const Duration(seconds: 0),
          receiveTimeout: const Duration(seconds: 0),
        ));

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access');
    await prefs.remove('refresh');
  }

  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
    required String password2,
    required String role,
    required String phone,
    required String dateOfBirth,
    required String gender,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'username': email,
        'email': email,
        'password': password,
        'password2': password2,
        'role': role,
        'phone': phone,
        'date_of_birth': dateOfBirth,
        'gender': gender,
      });

      final response = await _dio.post('/api/register/', data: formData);
      log('Register response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/login/',
        data: {"email": email, "password": password},
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response.data['data'].containsKey('access')) {
        await prefs.setString('access', response.data['data']['access']);
        await prefs.setString('refresh', response.data['data']['refresh']);
        return response.data;
      } else {
        throw Exception("Login failed: No access token in response");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access');

      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await _dio.get(
        '/api/user/',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<Map<String, dynamic>> updateUser({
    required String name,
    required String email,
    required String phone,
    required String country,
    required String profilePicture,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access');

      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'phone': phone,
        'country': country,
        'profile_picture': await MultipartFile.fromFile(profilePicture),
      });

      final response = await _dio.put(
        '/api/user/',
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }
}
