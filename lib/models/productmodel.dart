class ProductModel {
  String productImage;
  String productName;
  int productPrice;
  String productId;
  String productQuantity;

  List<dynamic> productUnit;
  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.productUnit,
  });
}
