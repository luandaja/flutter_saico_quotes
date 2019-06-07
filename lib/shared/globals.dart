import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:saico_quotes/shared/shared.dart';

class Globals {
  static const horizontalPadding = 40.0;
  static const quoteIconSize = 40.0;
  static const fontSize = 36.0;

  static final backgroundController = PageController();
  // static List<Quote> quotes = [Quote(message: "...consultando al hermano...")];

  // Globals() {
  //   _getQuotes().then((data) {
  //     quotes = data;
  //   });
  // }

  static Future<List<Quote>> getQuotes() async {
    var jsonStringData = await rootBundle.loadString('assets/data/quotes.json');
    final parsed = json.decode(jsonStringData).cast<Map<String, dynamic>>();
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }

  static Future<Quote> getRandomQuote() async {
    var quotes = await getQuotes();
    final _random = new Random();
    return quotes[_random.nextInt(quotes.length)];
  }
}
