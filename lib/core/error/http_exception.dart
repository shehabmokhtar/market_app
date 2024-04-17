class HttpException implements Exception {
  final String message;
  final String? localizedMessage;
  int? statusCode;
  HttpException(this.message, {this.localizedMessage, this.statusCode});

  @override
  String toString() {
    return message;
  }
}
