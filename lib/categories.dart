import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            'Category 1',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 2',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 3',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 4',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
