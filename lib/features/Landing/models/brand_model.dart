// ignore_for_file: public_member_api_docs, sort_constructors_first

class BrandModel {
  String imageUrl;
  BrandModel({
    required this.imageUrl,
  });
  static List<BrandModel> getSampleBrands() {
    return List.generate(6, (index) => BrandModel(imageUrl: 'brand-${index + 1}.png'));
  }
}
