import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListProvider extends ChangeNotifier {
  int pending = 0;
  int called = 0;
  int rescheduled = 0;
  bool _loaded = false; // track if data is already fetched
  bool get isDataLoaded => _loaded;

  Future<void> fetchCallSummary(String url) async {
    if (_loaded) return; // fetch only once
    _loaded = true;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        pending = data['pending'] ?? 0;
        called = data['called'] ?? 0;
        rescheduled = data['rescheduled'] ?? 0;

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
