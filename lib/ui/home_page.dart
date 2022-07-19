// ignore_for_file: unnecessary_null_comparison, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _search;

  int _offset = 0;

  _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=jZ4yCwYFcdWUzLKAoVYFeTyAVj7r5ESb&limit=20&rating=g');
    } else {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=jZ4yCwYFcdWUzLKAoVYFeTyAVj7r5ESb&q=$_search&limit=20&offset=$_offset&rating=g&lang=en');

      return json.decode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {
      // print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'GIPHY Flutter App',
          style: TextStyle(
            fontFamily: 'MontserratBlack',
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search all the GIFs',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
