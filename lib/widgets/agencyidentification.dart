import 'package:flutter/material.dart';

class Agencyidentification extends StatelessWidget {
  const Agencyidentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/image/photo2.jpg'),
        ),
        SizedBox(height: 16),
        Center(
          child: Text(
            "Agency Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Text("Feild", style: TextStyle(color: Color(0xFFFF6700))),
        ),
        Center(
          child: Text(
            "5 years of experience",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}