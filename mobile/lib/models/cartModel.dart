class CartModel {
  int productID;
  String productImage;
  String productTitle;
  String productDescription;
  int productPrice;
  int amount;

  // construtor
  CartModel(
      {this.productID,
      this.productImage,
      this.productTitle,
      this.productDescription,
      this.productPrice,
      this.amount});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productID: json['productID'],
      productImage: json['productImage'],
      productTitle: json['productTitle'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      amount: json['amount'],
    );
  }
}
