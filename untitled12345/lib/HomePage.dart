import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee mobile App'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg123.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.0), // Boşluk ekleniyor
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black38,
                  onPrimary: Colors.white,
                  elevation: 8.0,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                  child: Text(
                    'Go to the menu',
                    style: TextStyle(fontSize: 24.0), // Yazı boyutu büyütülüyor
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _showPasswordDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                  onPrimary: Colors.white,
                  elevation: 8.0,
                ),
                child: Text('Admin Page'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Admin Password'),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(hintText: 'enter the password'),
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
              _checkPassword(context);
            },
            child: Text('Entry'),
          ),
        ],
      ),
    );
  }

  void _checkPassword(BuildContext context) {
    final String adminPassword = '123'; // Set the administrator password here

    if (_passwordController.text == adminPassword) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/admin');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('The Wrong Password!')),
      );
    }
  }
}
