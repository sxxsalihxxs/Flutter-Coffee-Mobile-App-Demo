import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled12345/CoffeePage.dart';

import 'CoffeeProvider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _tableNumberController = TextEditingController();

  @override
  void dispose() {
    _tableNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/bg123.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: coffeeProvider.selectedDrinks.length,
          itemBuilder: (context, index) {
            final drink = coffeeProvider.selectedDrinks[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                title: Text(
                  drink,
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    coffeeProvider.removeDrink(drink, _getDrinkPrice(drink));
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: \$${coffeeProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showTableNumberDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey, // Change the button color
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Finish order',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTableNumberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Table Number'),
        content: TextField(
          controller: _tableNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Please enter table number',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              _completeOrder(context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _completeOrder(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context, listen: false);
    final tableNumber = _tableNumberController.text;
    final List<String> selectedDrinks = coffeeProvider.selectedDrinks;
    final String order = 'Masa $tableNumber: ${selectedDrinks.join(', ')}';

    coffeeProvider.addOrder(order); // Siparişi adminOrders listesine ekler
    coffeeProvider.clearCart(); // Sepeti temizler

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => CoffeePage(),
        transitionsBuilder: (context, animation1, animation2, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation1.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  double _getDrinkPrice(String drink) {
    // Burada içeceğin fiyatını döndürmek için kendi veri kaynağınıza göre düzenlemeniz gerekmektedir.
    switch (drink) {
      case 'Affogato':
        return 3.99;
      case 'IceAmericano':
        return 4.99;
      case 'IceLatte':
        return 4.49;
      case 'IceMocha':
        return 5.49;
      case 'Yeşil Çay':
        return 2.99;
      case 'Kurabiye':
        return 2.99;
      default:
        return 0.0;
    }
  }
}
