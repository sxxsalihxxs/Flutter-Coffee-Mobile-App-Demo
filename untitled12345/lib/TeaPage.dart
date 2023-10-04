import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'CoffeeItem.dart';

class TeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çay'),
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
          CoffeeItem('green tea', 2.99),
          CoffeeItem('black tea', 2.49),
          CoffeeItem('red tea', 3.49),
        ],
      ),
    );
  }
}
