class ShopData {
  String location;
  List<Shop> shops;

  ShopData({this.location, this.shops});

  factory ShopData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['shops'] as List;
    print(list.runtimeType);
    List<Shop> shoplist = list.map((i) => Shop.fromJson(i)).toList();

    return ShopData(location: parsedJson['area'], shops: shoplist);
  }
}

class Shop {
  String name;
  String address;
  String about;
  double rating;
  List<Product> products;

  Shop({
    this.name,
    this.address,
    this.about,
    this.rating,
    this.products,
  });

  factory Shop.fromJson(Map<String, dynamic> parsedJson) {
    var pList = parsedJson['products'] as List;
    List<Product> productList = pList.map((i) => Product.fromJson(i)).toList();

    return Shop(
      name: parsedJson['name'],
      address: parsedJson['address'],
      about: parsedJson['about'],
      rating: parsedJson['rating'],
      products: productList,
    );
  }
}

class Product {
  double id;
  String productName;
  String productCategory;
  double productBasePrice;

  Product(
      {this.id, this.productBasePrice, this.productName, this.productCategory});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toDouble(),
      productName: json['productName'],
      productCategory: json['productCategory'],
      productBasePrice: json['productBasePrice'].toDouble(),
    );
  }
}
