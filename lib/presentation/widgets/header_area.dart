import 'package:flutter/material.dart';

class HeaderArea extends StatelessWidget {
  final String username; 

  const HeaderArea({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 110,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Welcome & photo
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: Colors.grey),
                ),
                const SizedBox(width: 14),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xFFFF6700),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      username, // Display real username
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const Icon(
              Icons.notifications_outlined,
              color: Color(0xFFFF6700),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
