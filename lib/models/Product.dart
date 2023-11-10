import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, brand;
  final List<String> images;
  final List<Color> colors;
  final List<int> sizes;

  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.sizes,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.brand,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      id: 1,
      images: [
        "assets/images/book1.jpg",
        "assets/images/book1.1.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [1, 2],
      title: "Sách Đen\nBộ Công Cụ Của Phụ Nữ",
      price: 5400,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      brand: 'Tâm linh'),
  Product(
      id: 2,
      images: [
        "assets/images/book2.2.jpg",
        "assets/images/book2.3.jpg",
        "assets/images/book2.4.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [1,2,3],
      title: "Being In Love\nYêu Trong Tỉnh Thức",
      price: 10100,
      description: description,
      rating: 4.1,
      isPopular: true,
      brand: 'Tiểu thuyết'),
  Product(
      id: 3,
      images: [
        "assets/images/book3.2.jpg",
        "assets/images/book3.1.jpg"

      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [1],
      title: "Ra Bờ Suối\nNgắm Hoa Kèn Hồng",
      price: 13100,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
      brand: 'Khoa học công nghệ'),
  Product(
    id: 4,
    images: [
      "assets/images/book4.1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    sizes: [1, 2, 3, 4],
    title: "Trại hoa vàng",
    price: 9000,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    brand: 'Tâm linh',
  ),
];

const String description =
    "”Sách Đen” là tuyển chọn những lời khuyên cho sự nghiệp\n"
    "được đúc kết từ những hiểu biết và trải nghiệm đầy khôn\n"
    "ngoan và sâu sắc của tác giả Otegha Uwagba (người sáng\n"
    "lập Women-Who, một cộng đồng được tạo ra để kết nối và...";

class Category {
  final String icon, text;
  final String? type;

  Category({required this.icon, required this.text, this.type = 'item'});
}

List<Category> categories = [
  Category(icon: "assets/icons/halloween_ghost.svg", text: 'Tâm linh'),
  Category(icon: "assets/icons/Heart Icon_2.svg", text: 'Tiểu thuyết'),
  Category(icon: "assets/icons/technology-icon.svg", text: 'Khoa học công nghệ'),
];
