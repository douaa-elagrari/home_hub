import 'package:flutter/material.dart';
import '../widgets/buildtextfeild.dart';

class BuyCard extends StatefulWidget {
  final String itemprice;
  const BuyCard({super.key, this.itemprice = "200"});

  @override
  State<BuyCard> createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth * 0.055;
    double labelFontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true, // avoids overflow when keyboard opens
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xFF004E98), // blue focus color
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Purchase Details",
                        style: TextStyle(
                          color: const Color(0xFF004E98),
                          fontWeight: FontWeight.bold,
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full Name
                    Text(
                      "Add your full name",
                      style: TextStyle(fontSize: labelFontSize, color: Colors.black54),
                    ),
                    buildTextField(context, "Full Name", "Enter your name",
                        prefixIcon: const Icon(Icons.person)),

                    const SizedBox(height: 12),

                    // Phone Number
                    Text(
                      "Insert your phone number",
                      style: TextStyle(fontSize: labelFontSize, color: Colors.black54),
                    ),
                    buildTextField(context, "Phone Number", "Enter your phone number",
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone)),

                    const SizedBox(height: 12),

                    // Address
                    Text(
                      "Insert your address",
                      style: TextStyle(fontSize: labelFontSize, color: Colors.black54),
                    ),
                    buildTextField(context, "Address", "Enter your address",
                        prefixIcon: const Icon(Icons.home)),

                    const SizedBox(height: 12),

                    // Quantity
                    Text(
                      "Add the wanted quantity",
                      style: TextStyle(fontSize: labelFontSize, color: Colors.black54),
                    ),
                    buildTextField(context, "Quantity", "Enter quantity",
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.confirmation_number)),

                    const SizedBox(height: 20),

                    // Total Price
                    Text(
                      "Total Price",
                      style: TextStyle(
                        color: const Color(0xFF004E98),
                        fontWeight: FontWeight.bold,
                        fontSize: labelFontSize + 2,
                      ),
                    ),
                    Center(
                      child: Text(
                        "${widget.itemprice} DA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06,
                          color: const Color(0xFFFF6700),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004E98),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
