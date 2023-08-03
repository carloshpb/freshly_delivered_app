import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final String _searchText;

  const SearchResultsScreen({super.key, required String searchText})
      : _searchText = searchText;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
              //child: Text(),
              ),
        ),
      ),
    );
  }
}
