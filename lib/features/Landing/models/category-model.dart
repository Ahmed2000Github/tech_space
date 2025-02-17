// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String name;
  String image;
  CategoryModel({
    required this.name,
    required this.image,
  });

  static List<CategoryModel> categories = [
    CategoryModel(name: 'Accessories', image: 'product-2.png'),
    CategoryModel(name: 'Camera', image: 'product-3.png'),
    CategoryModel(name: 'Laptop', image: 'product-4.png'),
    CategoryModel(name: 'Smart Phone', image: 'product-5.png'),
    CategoryModel(name: 'Gaming', image: 'product-6.png'),
    CategoryModel(name: 'Smart Watch', image: 'product-7.png'),
  ];
  static List<CategoryModel> categories2 = [
    CategoryModel(name: 'Watch & Earpods', image: 'assets/images/products/product-25.png'),
    CategoryModel(name: 'Holder', image: 'assets/images/products/product-26.png'),
    CategoryModel(name: 'Power cables', image: 'assets/images/products/product-27.png'),
    CategoryModel(name: 'Cases & Protection', image: 'assets/images/products/product-28.png'),
  ];
}
