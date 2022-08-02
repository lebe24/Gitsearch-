import 'package:gitsearch/model/search_result.dart';
import 'package:gitsearch/model/gitcache.dart';
import 'package:gitsearch/services/gitClient.dart';
import 'dart:async';


class GithubRepository {
  const GithubRepository(this.cache, this.client);

  final GithubCache cache;
  final GithubClient client;

  Future<SearchResult> search(String term) async {
    final cachedResult = cache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.search(term);
    cache.set(term, result);
    return result;
  }
}

