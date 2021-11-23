import 'i_error.dart';

class StorageError extends IError {
  StorageError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
