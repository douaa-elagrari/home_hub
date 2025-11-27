import 'package:flutter/material.dart';
import '../widgets/buybutton.dart';

class Priceandbuy extends StatelessWidget {
  final double price;
  final String productdesc;

  const Priceandbuy({
    super.key,
    required this.price,
    required this.productdesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productdesc, style: const TextStyle(fontSize: 16)),
              Text(
                "${price.toStringAsFixed(3)} DA",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xFFFF6700),
                ),
              ),
            ],
          ),
          TheButton(),
        ],
      ),
    );
  }
}