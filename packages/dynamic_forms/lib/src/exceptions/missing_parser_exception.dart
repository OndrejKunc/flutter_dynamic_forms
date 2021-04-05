class MissingParserException implements Exception {
  final String elementName;
  final StackTrace? stackTrace;
  MissingParserException(this.elementName, [this.stackTrace]);
  @override
  String toString() {
    return 'Missing parser for element $elementName.\n'
        '${stackTrace ?? ''}';
  }
}
