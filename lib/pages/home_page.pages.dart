import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my home page',
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'welcome in Your App  ',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
      ),
    );
  }
}
