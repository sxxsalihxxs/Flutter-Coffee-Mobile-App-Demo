import 'package:flutter/foundation.dart';

class CoffeeProvider extends ChangeNotifier {
  List<String> _selectedDrinks = [];
  double _totalPrice = 0;
  List<String> _adminOrders = [];

  List<String> get selectedDrinks => _selectedDrinks;
  double get totalPrice => _totalPrice;
  List<String> get adminOrders => _adminOrders;

  void addDrink(String drink, double price) {
    _selectedDrinks.add(drink);
    _totalPrice += price;
    notifyListeners();
  }

  void removeDrink(String drink, double price) {
    _selectedDrinks.remove(drink);
    _totalPrice -= price;
    notifyListeners();
  }

  void addOrder(String order) {
    _adminOrders.add(order);
    notifyListeners();
  }

  void clearCart() {
    _selectedDrinks.clear();
    _totalPrice = 0;
    notifyListeners();
  }
}
