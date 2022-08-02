import 'package:flutter/material.dart';
import 'package:gitsearch/bloc/git_search_bloc.dart';
import 'package:gitsearch/bloc/git_search_event.dart';
import 'package:provider/provider.dart';



class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  late GithubSearchBloc _githubSearchBloc;

  @override
  void initState() {
    super.initState();
    // _SearchBar accesses GitHubSearchBloc and notifies the bloc of TextChanged
    _githubSearchBloc = context.read<GithubSearchBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Git',
                  style: TextStyle(
                      color: Color(0xFFE9B807),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Search',
                  style: TextStyle(
                      color: Color(0xFFF9F8F7),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '.',
                  style: TextStyle(
                      color: Color(0xFFE9B807),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              child:  TextField(
                autocorrect: false,
                controller: _textController,
                onChanged: (text) {
                  _githubSearchBloc.add(
                  TextChanged(text: text));
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFE9B807), width: 2.0),
                  ),
                  hintStyle: TextStyle(color: Color(0x52FFFFFF)),
                  hintText: 'Search ',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon:GestureDetector(
                    onTap: _onClearTapped,
                    child: const Icon(Icons.clear,
                      color: Colors.white,
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _githubSearchBloc.add(const TextChanged(text: ''));
  }
}
