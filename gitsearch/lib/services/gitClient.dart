import 'dart:async';
import 'dart:convert';
import 'package:gitsearch/model/search_error.dart';

import 'package:http/http.dart' as http;
import 'package:gitsearch/model/search_result.dart';

class GithubClient {
  GithubClient({
    http.Client? httpClient,
    this.baseUrl = "https://api.github.com/search/repositories?q=",
  }) : this.httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;

  Future<SearchResult> search(String term) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$term"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
