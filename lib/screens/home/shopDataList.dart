import 'package:flutter/material.dart';
import 'package:flutter_assessmet/screens/shop_view/shop_list.dart';
import 'package:flutter_assessmet/services/database.dart';

class ShopDataList extends StatelessWidget {
  final List<ShopData> shopsData;
  ShopDataList({Key key, this.shopsData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: shopsData == null ? 0 : shopsData.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopList(shopsData: shopsData[index]),
              ),
            );
          },
          child: new Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      shopsData[index].location,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
