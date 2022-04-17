import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hallo_app/screens/detail.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  final String Url = 'http://10.2.2:8000/api/product';

  Future getProduct() async {
    var response = await http.get(Uri.parse(Url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
        appBar: AppBar(
          title: Text('Rollo Store'),
        ),
        body: FutureBuilder(
            future: getProduct(),
            builder: (context, asyncsnapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 180,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  snapshot.data['data'][index]['image_url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    snapshot.data['data'][index]['name'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.data['data'][index]
                                      ['description']),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.edit),
                                      Text(snapshot.data['data'][index]
                                          ['price']),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('Data Eror');
              }
            }));
  }
}
