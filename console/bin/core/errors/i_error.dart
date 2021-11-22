abstract class IError implements Exception {
  final String message;
  final StackTrace stackTrace;

  IError(this.message, this.stackTrace);
}
