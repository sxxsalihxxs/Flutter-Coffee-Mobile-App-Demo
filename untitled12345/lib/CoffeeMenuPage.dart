import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'CoffeePage.dart';
import 'DessertPage.dart';
import 'TeaPage.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee mobile App'),
        backgroundColor: Colors.black, // Change the app bar color to black
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
      body: Stack(
        // Use a Stack to overlay the background image and the column of buttons
        children: [
          Image.asset(
            'assets/bg123.jpg', // Replace 'assets/background_image.png' with the actual image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoffeePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black38,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Coffee',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeaPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black38,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Tea',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DessertPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black38,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Dessert',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
