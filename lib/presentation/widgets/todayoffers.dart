import '../../utils/utils.dart';

class TodayOffersSection extends StatelessWidget {
  const TodayOffersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // get localized strings

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.todayOffers, // use localized string
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004E98),
          ),
        ),
        const SizedBox(height: 10),

        // ✅ Horizontal scrolling section
        SizedBox(
          height: 240, // fixed height so ListView can scroll
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(), // smooth scroll
            itemCount: 5, // number of cards
            separatorBuilder: (context, index) =>
                const SizedBox(width: 14), // space between cards
            itemBuilder: (context, index) {
              return const OfferCard(); // your OfferCard widget
            },
          ),
        ),
      ],
    );
  }
}
