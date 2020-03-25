import 'package:flutter/material.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';

class ProductTile extends StatelessWidget {
  final products;
  ProductTile({Key key, @required this.products}) : super(key: key);

  addToCart(item, user) {
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products == null ? 0 : products.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductList(shopsData: shopsData[index]),
            //   ),
            // );
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Container(
                child: ListTile(
                  title: Text(
                    products[index].productName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle:
                      Text('R ' + products[index].productBasePrice.toString()),
                  trailing: RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.green[400],
                    label: Text(''),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
