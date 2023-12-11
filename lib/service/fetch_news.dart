import 'dart:convert';

import 'package:flutnews/utlis/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutnews/ui/components/app_searchbar.dart';

Future<List> fetchNews() async {

  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
        AppConstants.key +
        '&q=' +
        AppSearchBar.searchController.text),
  );
  Map result = jsonDecode(response.body);
  print('Data Fetched');

  return (result['articles']);
}