import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/product_view/product_tile.dart';
import 'package:flutter_assessmet/screens/shopping_cart/shopping_cart.dart';

class ProductList extends StatelessWidget {
  final shopInfo;
  ProductList({Key key, this.shopInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(shopInfo.name),
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
      body: ProductTile(products: shopInfo.products),
    );
  }
}
