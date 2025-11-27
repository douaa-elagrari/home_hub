// mini dataset for trial
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final List<Color> availableColors;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.availableColors,
  });
}

final List<Product> products = [
  Product(
    id: 1,
    name: "Electric Drill",
    description:
        "A powerful 600W electric drill suitable for wood, metal, and concrete. Includes speed control and ergonomic handle.",
    price: 5500,
    category: "Tools",
    imageUrl: "assets/images/electricdrill.png",
    availableColors: [Colors.blueGrey, Colors.orange, Colors.black],
    rating: 5,
  ),
  Product(
    id: 2,
    name: "Safety Helmet",
    description:
        "Durable yellow construction helmet made from impact-resistant ABS plastic for maximum head protection.",
    price: 1200,
    category: "Safety",
    imageUrl: "assets/images/savety.png",
    availableColors: [Colors.yellow, Colors.redAccent, Colors.white],
    rating: 3,
  ),
  Product(
    id: 3,
    name: "Cement Bag 25kg",
    description:
        "High-strength Portland cement ideal for concrete, plastering, and masonry work. 25kg bag.",
    price: 950,
    category: "Materials",
    imageUrl: "assets/images/ciment.png",
    availableColors: [Colors.grey, Colors.brown, Colors.black45],
    rating: 2.5,
  ),
  Product(
    id: 4,
    name: "LED Work Light",
    description:
        "Rechargeable LED work light with adjustable brightness, ideal for construction sites and workshops.",
    price: 3400,
    category: "Lighting",
    imageUrl: "assets/images/led.png",
    availableColors: [Colors.yellowAccent, Colors.orangeAccent, Colors.white],
    rating: 4,
  ),
];