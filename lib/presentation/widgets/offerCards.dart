import '../../utils/utils.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Localization instance

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // space for shadow
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5A7E8C).withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Top image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/offer.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            // 📄 Card content
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ⭐ Rating Row
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFF6700),
                        size: 16,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '(${loc.testimonial})', // Translatable testimonial
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9B9F98),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  // 🧹 Service Name
                  Text(
                    loc.homeCleaning, // Translatable service name
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // 🔥 Discount Text
                  Text(
                    '-25%', // you can also make this dynamic if needed
                    style: const TextStyle(
                      color: Color(0xFFFF6700),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 🟦 Claim Offer Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004E98),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text(
                        loc.claimOffer, // Translatable button text
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
