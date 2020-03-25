import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/authenticate/sign_in.dart';
import 'package:flutter_assessmet/screens/shop_view/shop_tile.dart';
import 'package:flutter_assessmet/screens/shopping_cart/shopping_cart.dart';
import 'package:flutter_assessmet/services/auth.dart';

class ShopList extends StatelessWidget {
  final AuthService _auth = AuthService();

  final shopsData;
  ShopList({Key key, @required this.shopsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(shopsData.location),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.shopping_cart),
            label: Text(''),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCart()),
              );
            },
          ),
        ],
      ),
      body: ShopsTile(shops: shopsData),
    );
  }
}
