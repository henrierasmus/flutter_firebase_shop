import 'package:flutter/material.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final UserData user;
  ItemTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          title: Text(
            'PlaceHolder',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text('Placeholder'),
          trailing: RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.close),
            color: Colors.red[600],
            label: Text(''),
          ),
        ),
      ),
    );
  }
}
