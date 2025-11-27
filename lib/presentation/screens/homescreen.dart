import '../../utils/utils.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the localized strings
    final loc = AppLocalizations.of(context)!;

    final List<Professional> professionals = [
      Professional(
        title: loc.architect,
        name: "Ahmed B.",
        price: "\$25/hr",
        location: loc.algiers,
        image: "assets/images/architect.png",
      ),
      Professional(
        title: loc.plumber,
        name: "Fatima K.",
        price: "\$30/hr",
        location: loc.oran,
        image: "assets/images/plumber.png",
      ),
      Professional(
        title: loc.architect,
        name: "Youssef M.",
        price: "\$20/hr",
        location: loc.constantine,
        image: "assets/images/architect.png",
      ),
      Professional(
        title: loc.carpenter,
        name: "Imane L.",
        price: "\$35/hr",
        location: loc.blida,
        image: "assets/images/electrecian.png",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: HeaderTopRow(username: loc.username), // translated username
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FeaturedPropertyCard(),
                  const SizedBox(height: 24),
                  const TodayOffersSection(),
                  const SizedBox(height: 24),

                  Text(
                    loc.services, // translated Services
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF004E98),
                      fontSize: 24,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Column(
                    children: professionals
                        .map((pro) => JobCard(professional: pro))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
