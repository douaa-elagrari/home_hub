import 'package:flutter/material.dart';
import 'package:homehub/screens/portfolioagencyuserview.dart';
import '../models/agency.dart';
import '../models/saved_item.dart';

class AgencyCard extends StatefulWidget {
  final Agency agency;

  const AgencyCard({super.key, required this.agency});

  @override
  State<AgencyCard> createState() => _AgencyCardState();
}

class _AgencyCardState extends State<AgencyCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.agency.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  widget.agency.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  widget.agency.description,
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.location_pin, size: 18),
                    const SizedBox(width: 4),
                    Text(widget.agency.location),
                    const Spacer(),
                    const Icon(Icons.phone, size: 18),
                    const SizedBox(width: 4),
                    Text(widget.agency.phone),
                  ],
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PortfolioAgency(agency: widget.agency),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004E98),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 45,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Consult Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // LIKE BUTTON
        Positioned(
          top: 26,
          right: 22,
          child: IconButton(
            icon: Icon(
              likedItems.any((l) => l.item == widget.agency)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Color(0xFFFF6700),
              size: 26,
            ),
            onPressed: () {
              setState(() {
                if (likedItems.any((l) => l.item == widget.agency)) {
                  likedItems.removeWhere((l) => l.item == widget.agency);
                } else {
                  likedItems.add(
                    SavedItem(type: SavedType.agency, item: widget.agency),
                  );
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
