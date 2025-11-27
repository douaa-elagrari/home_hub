import '../../utils/utils.dart';
// Make sure to import your HomeScreen

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // List of property images
  final List<String> images = [
    "assets/images/building.png",
    "assets/images/building.png",
    "assets/images/building.png",
    "assets/images/building.png",
    "assets/images/building.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button (always goes to HomeScreen)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
              // Image Slider
              SizedBox(
                height: 220,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),

              // Interactive Dots below slider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: _currentPage == index ? 12 : 8,
                        height: _currentPage == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? const Color(0xFF004E98)
                              : const Color(0xFF9B9F98),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price
                    Text(
                      '11 500 000 DZD',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF6700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description
                    const Text(
                      'A brand-new villa (on-plan) in a secure, gated residence, available with semi-finished interiors to allow the buyer to apply their own finishing touches. The residence includes underground garage parking, private garden space, children\'s play area and fitness room. Located close to shops, schools, and transport, this villa is perfect for a family seeking space, comfort and future value. Ready for hand-over soon. Ownership papers in order.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'mhalma, sidi abdallah, algiers',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Phone
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.black, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          '0781477862',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
