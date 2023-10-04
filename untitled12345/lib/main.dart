import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminPage.dart';
import 'CoffeeMenuPage.dart';
import 'CoffeeProvider.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeProvider(),
      child: MaterialApp(
        title: 'Coffee mobile App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:
            HomePage(), // Uygulama açıldığında "HomePage" sayfasında başlamasını sağlar
        routes: {
          '/menu': (context) => MenuPage(),
          '/admin': (context) => AdminPage(),
        },
      ),
    );
  }
}
