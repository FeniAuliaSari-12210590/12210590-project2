import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeritaPanelProvider with ChangeNotifier {
  List data = [];

  Future<List> muatdata() async {
    final url =
        "http://api.mediastack.com/v1/news?access_key=2f01b83e9a08671dfb187b4a9c1153b8";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      data = [];
    } else {
      final js = jsonDecode(response.body);
      data = js['data'];
    }
    notifyListeners();
    return data;
  }
}