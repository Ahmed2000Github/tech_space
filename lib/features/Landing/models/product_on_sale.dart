// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductOnSale {
  double discountPercentage;
  String name;
  double originalPrice;
  double salePrice;
  String image;

  ProductOnSale({
    required this.discountPercentage,
    required this.name,
    required this.originalPrice,
    required this.salePrice,
    required this.image,
  });

  static List<ProductOnSale> products = [
    ProductOnSale(
      discountPercentage: 50,
      name: 'Logitech G502 Gaming Mouse',
      originalPrice: 38.00,
      salePrice: 19.00,
      image: 'product-8.png',
    ),
    ProductOnSale(
      discountPercentage: 30,
      name:
          'NPET K10 Wired Gaming Keyboard, LED Backlit, Spill-Resistant Design',
      originalPrice: 49.00,
      salePrice: 34.30,
      image: 'product-9.png',
    ),
    ProductOnSale(
      discountPercentage: 20,
      name: 'Apple Watch Series 7 (GPS, 41MM)',
      originalPrice: 289.00,
      salePrice: 231.20,
      image: 'product-10.png',
    ),
    ProductOnSale(
      discountPercentage: 25,
      name: 'Apple 2022 MacBook Air M2 Chip (8GB RAM, 256GB SSD)',
      originalPrice: 950.22,
      salePrice: 712.66,
      image: 'product-11.png',
    ),
    ProductOnSale(
      discountPercentage: 17,
      name: 'samsung Titan smart watch',
      originalPrice: 120.00,
      salePrice: 99.60,
      image: 'product-12.png',
    ),
  ];
}


