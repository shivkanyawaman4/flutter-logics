import 'package:flutter/material.dart';
import 'package:flutter_logic_book/add_contacts.dart';
import 'package:flutter_logic_book/main.dart';

import 'improved_scrolling.dart';
import 'linearindicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            child: GridTile(
              child: Container(
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          InkWell(
            child: GridTile(
              child: Container(
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Contacts()));
            },
          ),
          InkWell(
            child: GridTile(
              child: Container(
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LinearIndicator()));
            },
          ),
          InkWell(
            child: GridTile(
              child: Container(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScrollablePage()));
            },
          ),
        ],
      ),
    );
  }
}
