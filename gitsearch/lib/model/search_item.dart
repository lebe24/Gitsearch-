import 'package:gitsearch/model/gituser.dart';

class SearchResultItem {
  const SearchResultItem(
      {required this.fullName,
      required this.htmlUrl,
      required this.owner,
      required this.lang,
      required this.visible,
      required this.dec});

  final String fullName;
  final String htmlUrl;
  final GithubUser owner;
  final String dec;
  final String visible;
  final String lang;

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      dec: json['description'] as String,
      lang: json['language'] as String,
      visible: json['visibility'] as String,
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner']),
    );
  }
}
