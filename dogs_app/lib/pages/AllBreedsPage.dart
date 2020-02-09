import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllBreedsPage extends StatefulWidget {
  AllBreedsPage({Key key}) : super(key: key);

  @override
  _AllBreedsPageState createState() {
    return _AllBreedsPageState();
  }
}

class _AllBreedsPageState extends State<AllBreedsPage> {
  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String data;

  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.encodeFull("https://dog.ceo/api/breeds/image/random"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body)['message'];
    });
    FocusScope.of(context).requestFocus(FocusNode());
    return "Success on getting data";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        data != null ? Image.network(data) : Container(),
      ],
    );
  }
}
