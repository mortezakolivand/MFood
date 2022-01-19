import 'package:flutter/material.dart';
import 'package:m_food/models/product.dart';
import 'package:collection/collection.dart';

class Store extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cart = [];
  Product? _active;

  String tempText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  """;

  Store() {
    _products = [
      Product(1, "Grilled beef steak", 25.00, 0, "grilled-beef-steak.png",
          tempText),
      Product(2, "Penne pasta", 17.50, 0, "Penne-pasta.png", tempText),
      Product(3, "Salad", 6.80, 0, "Salad.png", tempText),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get cart => _cart;
  Product? get activeProduct => _active;

  setActiveProduct(Product product) {
    _active = product;
  }

  clearCart() {
    for (Product p in _products) {
      p.quantity = 0;
    }
    _cart.clear();
    notifyListeners();
  }

  addItemToCart(Product product) {
    print("adding ${product.name}");
    Product? _found = _cart.firstWhereOrNull(
      (p) => p.id == product.id,
    );

    if (_found != null) {
      _found.quantity += 1;
    } else {
      _cart.add(product);
      product.quantity += 1;
    }
    notifyListeners();
  }

  removeItemFromCart(Product product) {
    Product? found = _cart.firstWhereOrNull((p) => p.id == product.id);
    if (found != null && found.quantity == 1) {
      product.quantity = 0;
      _cart.remove(product);
    }
    if (found != null && found.quantity > 1) {
      found.quantity -= 1;
    }
    notifyListeners();
  }

  int getCartQuantity() {
    int total = 0;
    for (Product p in _cart) {
      total += p.quantity;
    }
    return total;
  }

  double getCartTotal() {
    double price = 0;
    for (Product p in _cart) {
      price += (p.price * p.quantity);
    }
    return price;
  }
}
