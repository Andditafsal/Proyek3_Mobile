import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({ Key? key }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                  const Text('ini Halaman Detail'),
                ElevatedButton(
                    child: const Text('Kembali'),
                    onPressed: (){
                    debugPrint('Kembali');
                    }, )
                  ],
                ),
            ),
    );
  }
}