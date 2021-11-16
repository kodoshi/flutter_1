/// custom Error classes, thrown by the bloc architecture
abstract class CustomException implements Exception {
  final String title;
  final String message;

  CustomException({required this.title, required this.message});
}

class NetworkException implements CustomException {
  final String title = "Network Error";
  final String message = "A network error occurred";

  NetworkException();
}

class ApiException implements CustomException {
  final String title = "API Error";
  final String message = "An API error occurred";

  ApiException();
}

class DataException implements CustomException {
  final String title = "Data Error";
  final String message = "Full record data is not available";

  DataException();
}

class UnknownError implements CustomException {
  final String title = "Unknown Error";
  final String message = "An unknown error occurred";

  UnknownError();
}
