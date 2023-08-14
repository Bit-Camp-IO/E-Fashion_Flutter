import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: brandProducts.length,
        itemBuilder: (context, index) {
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text('Item $index - Custom Style'),
                ),
              ),
            );
          } else if (index == 1) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Text('Item $index - Custom Style'),
                ),
              ),
            );
          } else if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Item $index - Style 1'),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text('Item $index - Style 2'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
