import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Search')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Search...",
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (_, id) {
            return ListTile();
          }),
        ),
      ]),
    );
  }
}
