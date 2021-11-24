import 'i_error.dart';

class DomainError extends IError {
  DomainError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
