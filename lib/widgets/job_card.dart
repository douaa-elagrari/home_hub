import 'package:flutter/material.dart';
import 'package:homehub/screens/portfoliouserview.dart';
import '../models/professional.dart';
import '../models/saved_item.dart';

class JobCard extends StatefulWidget {
  final Professional professional;

  const JobCard({super.key, required this.professional});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.professional.image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.professional.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(widget.professional.name),
                          Text(
                            widget.professional.price,
                            style: const TextStyle(
                              color: Color(0xFFFF6700),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_pin, size: 14),
                              const SizedBox(width: 4),
                              Text(widget.professional.location),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Portfolio(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2E2E2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004E98),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Contact",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // LIKE button
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(
              likedItems.any((l) => l.item == widget.professional)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Color(0xFFFF6700),
              size: 26,
            ),
            onPressed: () {
              setState(() {
                if (likedItems.any((l) => l.item == widget.professional)) {
                  likedItems.removeWhere((l) => l.item == widget.professional);
                } else {
                  likedItems.add(
                    SavedItem(
                      type: SavedType.service,
                      item: widget.professional,
                    ),
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
