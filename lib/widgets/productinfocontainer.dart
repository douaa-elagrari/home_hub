import 'package:flutter/material.dart';

class Productinfocontainer extends StatelessWidget {
  final String infotitle;
  final String information;

  const Productinfocontainer({
    super.key,
    required this.infotitle,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, -4), // shadow ta7t
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(infotitle, style: const TextStyle(color: Colors.black87)),
          Text(information, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}