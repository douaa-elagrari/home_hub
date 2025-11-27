import 'package:flutter/material.dart';
import '../screens/buyforms.dart';

class TheButton extends StatelessWidget {
  const TheButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Buyformspage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004E98),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Buy Now', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}