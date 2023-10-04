import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CoffeeProvider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee mobile App'),
      ),
      body: ListView.builder(
        itemCount: coffeeProvider.adminOrders.length,
        itemBuilder: (context, index) {
          final order = coffeeProvider.adminOrders[index];
          return ListTile(
            title: Text(order),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                coffeeProvider.adminOrders.removeAt(index);
                coffeeProvider.notifyListeners();
              },
            ),
          );
        },
      ),
    );
  }
}
