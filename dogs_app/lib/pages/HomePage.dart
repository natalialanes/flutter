import 'package:dogs_app/pages/AllBreedsPage.dart';
import 'package:dogs_app/pages/SearchPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int currentIndex;
  HomePage({Key key, this.currentIndex}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  selectCurrentPage() {
    switch (widget.currentIndex) {
      case 0:
        return SearchPage();
        break;
      case 1:
        return AllBreedsPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          selectCurrentPage(),
        ],
      ),
    );
  }
}
