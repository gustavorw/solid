import 'i_error.dart';

class DatasourceError extends IError {
  DatasourceError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
