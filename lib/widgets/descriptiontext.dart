import 'package:flutter/material.dart';

class Descriptiontext extends StatelessWidget {
  final String descriptionTitle;
  final String descriptionParag;

  const Descriptiontext({
    super.key,
    required this.descriptionTitle,
    required this.descriptionParag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            descriptionTitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            descriptionParag,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}