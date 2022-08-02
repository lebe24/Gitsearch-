import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/Screens/SearchResult.dart';
import 'package:gitsearch/bloc/git_search_bloc.dart';
import 'package:gitsearch/bloc/git_search_state.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const Center(child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? const Center(
                  child: Text(
                  'No Results',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow),
                ))
              : Expanded(child: SearchResults(items: state.items));
        }
        return const Center(
            child: Text(
          'Please enter a term to begin',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.yellow),
        ));
      },
    );
  }
}
