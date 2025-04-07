class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  String message = '';

  FetchDataException([this.message = ''])
      : super(message, "Error During Communication: ");
}

class NoInternetException extends AppException {
  String message = '';

  NoInternetException([this.message = ''])
      : super(message, "Please check your internet connection");
}

class BadRequestException extends AppException {
  String message = '';

  BadRequestException({required this.message}) : super(message, "");
}

class UnauthorisedException extends AppException {
  String message = '';

  UnauthorisedException({required this.message}) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class RecordNotFoundException extends AppException {
  RecordNotFoundException({String? message, Object? obj})
      : super(message, "$obj Record not found");
}

class JsonParsingException extends AppException {
  JsonParsingException({required String message, required String obj})
      : super(message, "$obj Json Parsing Error");
}

class InternalServerError extends AppException {
  String message = '';

  InternalServerError({required this.message}) : super(message, "");
}

class UrlNotFoundException extends AppException {
  String message = '';

  UrlNotFoundException({required this.message}) : super(message, "");
}

class DataNotFoundException extends AppException {
  String message = 'Data not found';

  DataNotFoundException({this.message = 'Data not found'}) : super(message, "");
}

class ImageUploadException extends AppException {
  ImageUploadException.empty();
 
  ImageUploadException({required String message})
      : super(message, " Image Upload Exception");
}
