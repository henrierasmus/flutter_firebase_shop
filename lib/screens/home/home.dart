import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/home/shopDataList.dart';
import 'package:flutter_assessmet/screens/shopping_cart/shopping_cart.dart';
import 'package:flutter_assessmet/services/auth.dart';
import 'package:flutter_assessmet/services/database.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Locations'),
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
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: new Container(
        child: new Center(
          // Use future builder and DefaultAssetBundle to load the local JSON file
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/generated.json'),
            builder: (context, snapshot) {
              List<ShopData> shopsData = parseJson(
                snapshot.data,
              );
              return shopsData.isNotEmpty
                  ? new ShopDataList(shopsData: shopsData)
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }

  List<ShopData> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<ShopData>((json) => new ShopData.fromJson(json)).toList();
  }
}
