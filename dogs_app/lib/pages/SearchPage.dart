import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String data;
  String typedBreed;

  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dog.ceo/api/breed/${breedController.text}/images/random"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body)['message'];
    });
    FocusScope.of(context).requestFocus(FocusNode());
    return "Success on getting data";
  }

  TextEditingController breedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Type the breed you want to see:",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
        TextField(
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
            child: Icon(
              Icons.search,
            ),
            onTap: getJSONData,
          )),
          controller: breedController,
        ),
        data != null ? Image.network(data) : Container(),
      ],
    );
  }
}
