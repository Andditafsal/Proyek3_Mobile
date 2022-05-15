import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hallo_app/screens/home_page.dart';
import 'package:hallo_app/products/home_page.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatelessWidget {
  final Map product;

  EditProduct({required this.product});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _deskriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  Future updateProduct() async {
    final response = await http.put(
        Uri.parse(
            "http://192.168.43.37:8000/api/products" + product['id'].toString()),
        body: {
          "name": _nameController.text,
          "Deskription": _deskriptionController.text,
          "price": _priceController.text,
          "imageUrl": _imageUrlController.text
        });
    print(response.body);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController..text = product['name'],
              decoration: InputDecoration(labelText: "Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product name";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _deskriptionController..text = product['Deskription'],
              decoration: InputDecoration(labelText: "Deskription"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Deskription";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController..text = product['price'],
              decoration: InputDecoration(labelText: "Price"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product price";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageUrlController..text = product['image_url'],
              decoration: InputDecoration(labelText: "Image URL"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Image URL";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateProduct().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Product berhasil diubah"),
                      ));
                    });
                  }
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}