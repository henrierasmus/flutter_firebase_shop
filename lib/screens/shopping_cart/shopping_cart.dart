import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/shopping_cart/settings_form.dart';
import 'package:flutter_assessmet/screens/shopping_cart/user_display.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assessmet/services/userData.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';
import 'package:flutter_assessmet/models/user.dart';

class ShoppingCart extends StatelessWidget {

  ShoppingCart({this.user});
  final user;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<UserData>.value(
      value: DataBaseService(uid: user.uid).getUserData,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Shopping Cart'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text(''),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: UserDataDisplay(),
      ),
    );
  }
}
