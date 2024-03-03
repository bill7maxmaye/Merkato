import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double quantity;
  final String category;
  final List<String> images;
  final double price;

  final String? id;
  final String? user;

  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.category,
      required this.images,
      required this.price,
      required this.id,
      required this.user});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'category': category,
      'images': images,
      'price': price,
      'id': id,
      'user': user
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity']?.toDouble() ?? 0.0,
        category: map['category'],
        images: List<String>.from(map['images']),
        price: map['price']?.toDouble() ?? 0.0,
        id: map['_id'],
        user: map['user']);
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
