import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CoffeeProvider.dart';

class CoffeeItem extends StatelessWidget {
  final String name;
  final double price;

  CoffeeItem(
    this.name,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(color: Colors.white),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Provider.of<CoffeeProvider>(context, listen: false)
              .addDrink(name, price);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$name added to the cart')),
          );
        },
        child: Text(
          'add to cart',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black38,
        ),
      ),
    );
  }
}
