import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/product_view/product_list.dart';

class ShopsTile extends StatelessWidget {
  final shops;
  ShopsTile({Key key, @required this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shops == null ? 0 : shops.shops.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductList(shopInfo: shops.shops[index]),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Container(
                child: ListTile(
                  title: Text(
                    shops.shops[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing:
                      Text('Rating: ' + shops.shops[index].rating.toString()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
