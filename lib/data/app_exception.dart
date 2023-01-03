class AppExceptions implements Exception{
  final String message;
  final String prefix;
  AppExceptions({required this.prefix, required this.message});
  String toString(){
    return '$prefix $message';
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException(String message) : super(message: message, prefix: 'Error during data fetch!');
}

class BadRequestException extends AppExceptions{
  BadRequestException(String message): super(message: message, prefix: 'Bad Request');
}

class UnauthorizedException extends AppExceptions{
  UnauthorizedException(String message): super(message: message, prefix: 'Unauthorized Request');
}

class InvalidInputException extends AppExceptions{
  InvalidInputException(String message): super(message: message, prefix: 'Invalid input in the exception');
}