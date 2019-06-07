class Quote {
  String message;
  Quote({this.message});
  factory Quote.fromJson(Map<String, dynamic> parsedJson) {
    return Quote(
      message: parsedJson['message'],
    );
  }
}
