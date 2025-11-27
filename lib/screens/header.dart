import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 110, // Adjust height for your simplified header
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Removed back button

            // Welcome & photo
            Row(
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: Colors.grey),
                ),
                SizedBox(width: 14),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xFFFF6700),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Username',
                      style: TextStyle(color: Colors.black, fontSize: 12),
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
