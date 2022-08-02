import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:gitsearch/bloc/git_search_event.dart';
import 'package:gitsearch/bloc/git_search_state.dart';

import 'package:gitsearch/model/git_repo.dart';
import 'package:gitsearch/model/search_error.dart';

const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.githubRepository})
      : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final GithubRepository githubRepository;

  void _onTextChanged(
    TextChanged event,
    Emitter<GithubSearchState> emit,
  ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      final results = await githubRepository.search(searchTerm);
      emit(SearchStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? SearchStateError(error.message)
          : SearchStateError('something went wrong'));
    }
  }
}
