import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Center(child: AddRatingCard())),
      ),
    );
  }
}

class AddRatingCard extends StatefulWidget {
  const AddRatingCard({super.key});

  @override
  State<AddRatingCard> createState() => _AddRatingCardState();
}

class _AddRatingCardState extends State<AddRatingCard> {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();

  Widget buildTextField({required String label, bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: label == "Comment" ? commentController : null,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.grey.shade50,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF004E98), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
        ),
      ),
    );
  }

  Widget buildStar(int index) {
    IconData icon;
    if (rating >= index + 1) {
      icon = Icons.star;
    } else if (rating >= index + 0.5) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star_border;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          rating = index + 1.0;
        });
      },
      child: Icon(icon, color: Color(0xFFFF6700), size: 32),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Add Rating",
                style: TextStyle(
                  color: Color(0xFF004E98),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => buildStar(index)),
            ),
            const SizedBox(height: 16),
            buildTextField(label: "Comment"),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print("Rating: $rating");
                  print("Comment: ${commentController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004E98),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}