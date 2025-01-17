class CustomerException implements Exception {
  String message;
  CustomerException(this.message);

  @override
  String toString() => "CustomerException: $message";
}
