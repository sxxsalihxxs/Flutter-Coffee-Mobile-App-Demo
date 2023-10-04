import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'CoffeeItem.dart';

class DessertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dessert'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          CoffeeItem('Cheesecake', 6.99),
          CoffeeItem('Brownie', 4.99),
          CoffeeItem('ice cream', 7.49),
        ],
      ),
    );
  }
}
