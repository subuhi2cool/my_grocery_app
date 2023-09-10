class ProductDataModel{
  final String id;
  final String name;
  final String description;
  final String category;
  final String inStock;
  final String imageUrl;
  final double price;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.inStock,
    required this.imageUrl,
    required this.price
  });
}