// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:saico_quotes/shared/shared.dart';

// class Quotes with ChangeNotifier {
//   List<Quote> _quotes;

//   get quotes => _quotes;

//   Quotes() {
//     _getQuotes().then((data) {
//       _quotes = data;
//       notifyListeners();
//     });
//   }
//   Future<List<Quote>> _getQuotes() async {
//     var jsonStringData = await rootBundle.loadString('assets/data/quotes.json');
//     final parsed = json.decode(jsonStringData).cast<Map<String, dynamic>>();
//     return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
//   }
// }
