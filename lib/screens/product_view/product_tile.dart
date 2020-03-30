import 'package:flutter/material.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';
import 'package:flutter_assessmet/services/userData.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assessmet/models/user.dart';

class ProductTile extends StatelessWidget {
  final products;
  final user;
  ProductTile({Key key, @required this.products, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final userData = Provider.of<UserData>(context);
    List userCart = userData.shoppingCart;

    return StreamProvider<UserData>.value(
      value: DataBaseService(uid: user.uid).getUserData,
      child: ListView.builder(
        itemCount: products == null ? 0 : products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                    onPressed: () async {
                      userCart.insert(0, products[index]);
                      print(userCart.length);
                      print(userData.name);
                      // await DataBaseService(uid: user.uid)
                      //     .updateUserdata(userData.name, userCart);
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.green[400],
                    label: Text(''),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
