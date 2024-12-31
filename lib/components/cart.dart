import 'package:football_jersy_ecommerce/database/jersy.dart';

class Cart {
  static final List<Map<String, dynamic>> _items = [];

  static void addToCart(Jersy cloth, int quantity, String size, int? id) {
    print("IN aDD to cart");
    _items.add({
      'id': id,
      'cloth': cloth,
      'quantity': quantity,
      'size': size,
    });
  }

  static List<Map<String, dynamic>> get items => _items;

  static void clearCart() {
    _items.clear();
  }

  static void removeFromCart(int index) {
    if (index >= 0 && index <= items.length) {
      _items.removeAt(index);
    }
  }
}
