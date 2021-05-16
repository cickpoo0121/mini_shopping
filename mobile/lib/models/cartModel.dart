import 'dart:convert';

class CartModel {
  int productID;
  String productImage;
  String productTitle;
  String productDescription;
  int productPrice;
  int amount;
  String productSize;

  // construtor
  CartModel(
      {this.productID,
      this.productImage,
      this.productTitle,
      this.productDescription,
      this.productPrice,
      this.amount,
      this.productSize});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productID: json['productID'],
      productImage: json['productImage'],
      productTitle: json['productTitle'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      amount: json['amount'],
      productSize: json['productSize'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'productImage': productImage,
      'productTitle': productTitle,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'amount': amount,
      'productSize': productSize
    };
  }
}
