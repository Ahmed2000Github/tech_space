// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {

  String name;
  String imageUrl;
  String price;
  String color;
  int samples;  
  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.color,
    required this.samples,
  });
  static List<CartItemModel> sampleItems = [
    CartItemModel(
      name: 'MacBook Pro M2 MNEJ3 2022 LLA',
      imageUrl: 'assets/images/products/product-29.png',
      price: '\$433.00',
      color: 'Black',
      samples: 1,
    ),
    CartItemModel(
      name: 'Inateck 12.3-13 Inch MacBook Case Sleeve',
      imageUrl: 'assets/images/products/product-30.png',
      price: '\$63.26',
      color: 'Blue',
      samples: 1,
    ),
    CartItemModel(
      name: 'Laptop Privacy Screen for 13 inch MacBook Pro & MacBook Air',
      imageUrl: 'assets/images/products/product-31.png',
      price: '\$23.26',
      color: 'Black',
      samples: 1,
    ),
  ];
}
