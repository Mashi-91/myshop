class HttpExpception implements Exception{
  final String message;

  HttpExpception(this.message);

  @override
  String toString() {
    return message;
  }
}
