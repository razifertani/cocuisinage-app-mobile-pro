class ApiException implements Exception {
  String message;

  ApiException({this.message = 'Veuillez réessayer plus tard !'});

  @override
  String toString() {
    return message;
  }
}
