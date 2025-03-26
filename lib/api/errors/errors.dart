import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';

      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again later.';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please check your connection.';

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      case DioExceptionType.connectionError:
        return 'Network connection error. Please check your internet.';

      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) return 'No response from server.';

    switch (response.statusCode) {
      case 400:
        return _extractErrorMessage(response.data) ??
            'Bad Request. Please check your input.';

      case 401:
        return 'Unauthorized. Please log in again.';

      case 403:
        return 'Forbidden. You do not have permission.';

      case 404:
        return 'Requested resource not found.';

      case 500:
        return 'Internal server error. Please try again later.';

      case 503:
        return 'Service unavailable. Please try again later.';

      default:
        return _extractErrorMessage(response.data) ??
            'Error ${response.statusCode}: An unexpected error occurred.';
    }
  }

  static String? _extractErrorMessage(dynamic errorData) {
    if (errorData == null) return null;

    // Handle different error response structures
    if (errorData is Map) {
      if (errorData.containsKey('error')) {
        return errorData['error']['message'];
      }
      if (errorData.containsKey('message')) return errorData['message'];
      if (errorData.containsKey('error')) return errorData['error'];
      if (errorData.containsKey('detail')) return errorData['detail'];

      // For nested structures like {'data': {'message': '...'}}
      if (errorData.containsKey('data') &&
          errorData['data'] is Map &&
          errorData['data'].containsKey('message')) {
        return errorData['data']['message'];
      }
    }

    return null;
  }
}
