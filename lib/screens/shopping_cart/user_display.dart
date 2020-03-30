import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';
import 'item_tile.dart';
import 'package:flutter_assessmet/screens/shopping_cart/shopping_cart.dart';

class UserDataDisplay extends StatefulWidget {
  @override
  _UserDataDisplayState createState() => _UserDataDisplayState();
}

class _UserDataDisplayState extends State<UserDataDisplay> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context) ?? [];

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemTile();
      },
    );
  }
}
