import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'CoffeeItem.dart';

class CoffeePage extends StatelessWidget {
  final List<Map<String, dynamic>> coffeeData = [
    {'name': 'Affogato', 'price': 3.99, 'image': 'assets/Affogato.jpg'},
    {'name': 'IceAmericano', 'price': 4.99, 'image': 'assets/IceAmericano.jpg'},
    {
      'name': 'IceLatte',
      'price': 4.49,
      'image': 'assets/IceLatte.jpg',
    },
    {'name': 'IceMocha', 'price': 5.49, 'image': 'assets/IceMocha.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee mobile App'),
        backgroundColor: Colors.black,
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg123.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: coffeeData.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.black38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            coffeeData[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 8.0,
                          left: 16.0,
                          child: Text(
                            coffeeData[index]['name'],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CoffeeItem(
                        coffeeData[index]['name'], coffeeData[index]['price']),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
