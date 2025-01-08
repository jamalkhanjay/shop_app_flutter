import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final int index;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven
            ? Color.fromRGBO(216, 240, 253, 1)
            : Color.fromRGBO(240, 240, 240, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // SizedBox(
          //   height: 10,

          // ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          // Image(image: AssetImage(image), height: 175)

          // altenative of using image
          Center(
            child: Image.asset(
              image,
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
