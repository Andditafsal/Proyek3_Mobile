import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Map product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        ),
        body: Column(
          children: [
            Container(
              child: Image.network(product['image_url']),
            ),
            SizeBox(
              height: 20,
              ),
            
          ],
      
          ),
    );
  }

 

 
}
