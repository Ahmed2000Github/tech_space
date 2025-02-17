class ProductModel {
  final String name;
  final String description;
  final double price;
  final double rating;
  int? reduction;
  final String imageUrl;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.reduction
  });

  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        name: 'Iphone 14 promax 256 gig',
        description: 'Latest Apple iPhone with 256GB storage',
        price: 979.90,
        rating: 4.5,
        imageUrl: 'product-13.png',
      ),
      ProductModel(
        name: 'Blackmagic Design Pocket Cinema Camera 6K Pro (Canon EF)',
        description: 'Professional cinema camera with Canon EF mount',
        price: 2535.00,
        rating: 4.8,
        imageUrl: 'product-14.png',
      ),
      ProductModel(
        name: 'SAMSUNG Galaxy S23 Ultra Cell Phone,256 GB',
        description: 'High-end Samsung smartphone with 256GB storage',
        price: 1410.87,
        rating: 4.7,
        imageUrl: 'product-15.png',
      ),
      ProductModel(
        name: 'VR VisionTech X1',
        description: 'Advanced VR headset for immersive experiences',
        price: 1018.00,
        rating: 4.7,
        imageUrl: 'product-16.png',
      ),
      
    ];
  }
  static List<ProductModel> getProducts2(){
    return [
      ProductModel(
      name: 'EchoX Pro H900',
      description: 'High-quality echo device with advanced features',
      price: 1090.00,
      rating: 4.1,
      imageUrl: 'product-20.png',
      ),
      ProductModel(
      name: 'Play Station 4 Pro 1Tb',
      description: 'Sony PlayStation 4 Pro with 1TB storage',
      price: 285.08,
      rating: 4.4,
      imageUrl: 'product-21.png',
      ),
      ProductModel(
      name: 'Apple MacBook Air 15" w/ Touch ID (2023) - Space Grey (Apple M2 Chip / 256GB SSD / 8GB RAM) - French',
      description: 'Latest Apple MacBook Air with M2 chip and 256GB SSD',
      price: 1883.05,
      rating: 4.5,
      imageUrl: 'product-22.png',
      ),
      ProductModel(
      name: 'Airpods pro2',
      description: 'Apple AirPods Pro 2 with advanced noise cancellation',
      price: 274.04,
      rating: 4.2,
      reduction:10,
      imageUrl: 'product-23.png',
      ),
    ];
  }
}