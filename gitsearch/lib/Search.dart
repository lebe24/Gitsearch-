import 'package:flutter/material.dart';
import 'package:gitsearch/Screens/SearchBar.dart';
import 'package:gitsearch/Screens/SearchBody.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: const <Widget>[
            SearchBar(),
            SearchBody(),
          ],
        ),
      ),
    );
  }
}
