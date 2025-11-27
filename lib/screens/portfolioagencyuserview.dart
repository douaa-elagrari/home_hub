import 'package:flutter/material.dart';
import '../models/agency.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class PortfolioAgency extends StatefulWidget {
  final Agency agency;

  const PortfolioAgency({super.key, required this.agency});

  @override
  State<PortfolioAgency> createState() => _PortfolioAgency();
}

class _PortfolioAgency extends State<PortfolioAgency> {
  int selectedTab = 1; // default to Materials tab

  void selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  // Sample materials (you can later replace with real agency materials)
  final List<Product> materials = [
    Product(
      name: "Cement Bag",
      price: "1200 DZD",
      rating: 4.6,
      reviews: 35,
      image: "assets/images/accessories.png",
    ),
    Product(
      name: "Steel Rods",
      price: "2500 DZD",
      rating: 4.8,
      reviews: 42,
      image: "assets/images/accessories.png",
    ),
    Product(
      name: "Concrete Blocks",
      price: "900 DZD",
      rating: 4.4,
      reviews: 27,
      image: "assets/images/accessories.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            children: [
              const SizedBox(height: 20.0),

              // Back Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Agency Info
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(widget.agency.image),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.agency.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.agency.location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFFF6700),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.agency.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9B9F98),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // Contact Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: add contact logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004E98),
                    minimumSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Tabs
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTabButton("Materials", 1),
                    const SizedBox(width: 10),
                    _buildTabButton("Reviews", 2),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Tab content
              if (selectedTab == 1) _buildMaterials(screenWidth),
              if (selectedTab == 2) _buildReviewCards(screenWidth),

              const SizedBox(height: 80),
            ],
          ),

          if (selectedTab == 2)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xFF004E98),
                shape: const CircleBorder(),
                child: const Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return ElevatedButton(
      onPressed: () => selectTab(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(110, 40),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 70,
            color: selectedTab == index
                ? const Color(0xFF004E98)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  /// ✅ Use your Product model and ProductCard widget here
  Widget _buildMaterials(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth < 600 ? 2 : 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: materials.length,
        itemBuilder: (context, index) {
          return ProductCard(product: materials[index]);
        },
      ),
    );
  }

  Widget _buildReviewCards(double screenWidth) {
    return Column(
      children: List.generate(6, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5A7E8C).withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          height: 190,
          width: screenWidth,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/i1.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "12/12/2026",
                            style: TextStyle(
                              color: Color(0xFF9B9F98),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "A sleek, modern hub showcasing your agency’s services and projects at a glance.",
                  style: TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
