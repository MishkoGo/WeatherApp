import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  String selectedResult;
  Function callback;

  MySearchDelegate(this.callback);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget buildResults(BuildContext context) {
    if(query == "") {
      return Container(
        child: Center(
          child: Text(selectedResult),
        ),
      );
    }
    else
      {
        
      }
  }

  @override
  void showResults(BuildContext context) {
      selectedResult = query;
      callback(query);
      close(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container(
      color: Color.fromRGBO(41, 50, 81, 1),
     );
  }
}