class BoxList {
  final String type;
  final String boxImg;
  final List<Product> products;

  BoxList({required this.type, required this.boxImg, required this.products});

  factory BoxList.fromJson(Map<String, dynamic> json) {
    return BoxList(
      type: json['type'],
      boxImg: json['box_img'],
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String productsImg;
  final int price;

  Product({required this.id, required this.name, required this.productsImg, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      productsImg: json['products_img'],
      price: json['price'],
    );
  }
}

class Box_products {
  final List<BoxList> boxList;

  Box_products({required this.boxList});

  factory Box_products.fromJson(Map<String, dynamic> json) {
    return Box_products(
      boxList: json['boxList'],
    );
  }
}