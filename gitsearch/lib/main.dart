import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/Search.dart';
import 'package:gitsearch/model/gitcache.dart';
import 'package:gitsearch/services/gitClient.dart';

import 'bloc/git_search_bloc.dart';
import 'model/git_repo.dart';

void main() {
  final GithubRepository githubRepository = GithubRepository(
    GithubCache(),
    GithubClient(),
  );

  runApp(MaterialApp(
    title: 'Github Search',
    home: Scaffold(
      backgroundColor: Color(0xFF121111),
      body: BlocProvider(
        create: (_) => GithubSearchBloc(githubRepository: githubRepository),
        child: Search(),
      ),
    ),
  ));
}


