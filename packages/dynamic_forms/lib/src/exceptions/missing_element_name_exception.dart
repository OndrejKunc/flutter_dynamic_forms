class MissingElementNameException implements Exception {
  final String message;
  MissingElementNameException(this.message);
  @override
  String toString() {
    return 'MissingElementNameException: $message';
  }
}
