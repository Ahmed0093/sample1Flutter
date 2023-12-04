import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}

enum Categories {
  dairy,
  fruit,
  hygiene,
  meat,
  sweets,
  carbs,
  vegetables,
  other,
  convenience,
  spices
}

class GroceryItem {
  const GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category2});

  final String id;
  final String name;
  final int quantity;
  final Category2 category2;
}

class Category2 {
  const Category2(this.title, this.color);

  final String title;
  final Color color;
}

// final groceryItems = [
//   GroceryItem(
//       id: 'a',
//       name: 'Milk',
//       quantity: 1,
//       category2: categories[Categories.hygiene]!),
//   GroceryItem(
//       id: 'b',
//       name: 'Bananas',
//       quantity: 5,
//       category2: categories[Categories.fruit]!),
//   GroceryItem(
//       id: 'c',
//       name: 'Beef Steak',
//       quantity: 1,
//       category2: categories[Categories.fruit]!),
// ];

const categories = {
  Categories.vegetables: Category2(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category2(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category2(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category2(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category2(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category2(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category2(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category2(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category2(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category2(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
