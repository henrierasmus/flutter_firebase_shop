import 'package:flutter/material.dart';
import 'item_tile.dart';

class UserDataDisplay extends StatefulWidget {
  @override
  _UserDataDisplayState createState() => _UserDataDisplayState();
}

class _UserDataDisplayState extends State<UserDataDisplay> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemTile();
      },
    );
  }
}
