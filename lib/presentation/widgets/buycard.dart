import 'package:flutter/material.dart';
import '../widgets/buildtextfeild.dart';

class BuyCard extends StatefulWidget {
  final String itemprice;
  const BuyCard({super.key, this.itemprice = "200"});

  @override
  State<BuyCard> createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Card(
          color: Colors.white,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Purchase Details",
                      style: TextStyle(
                        color: Color(0xFF004E98),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Add your full name",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  buildTextField("Full Name", "Enter your name"),
                  const SizedBox(height: 12),
                  const Text(
                    "Insert your phone number",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  buildTextField("Phone Number", "Enter your phone number"),
                  const SizedBox(height: 12),
                  const Text(
                    "Insert your address",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  buildTextField("Address", "Enter your address"),
                  const SizedBox(height: 12),
                  const Text(
                    "Add the wanted quantity",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  buildTextField("Quantity", "Enter quantity"),
                  const SizedBox(height: 20),
                  const Text(
                    "Total Price",
                    style: TextStyle(
                      color: Color(0xFF004E98),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Center(
                    child: Text(
                      "${widget.itemprice} DA",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFFFF6700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
          ),
        ),
      ),
    );
  }
}
