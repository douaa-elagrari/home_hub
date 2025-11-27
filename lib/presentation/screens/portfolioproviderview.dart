import '../../utils/utils.dart';

class PortfolioServiceProvider extends StatefulWidget {
  const PortfolioServiceProvider({super.key});

  @override
  State<PortfolioServiceProvider> createState() => _PortfolioServiceProvider();
}

class _PortfolioServiceProvider extends State<PortfolioServiceProvider> {
  int selectedTab = 0; // 0 = Portfolio, 1 = Services, 2 = Reviews

  void selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

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
              // Back Button at top
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Avatar and user info
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage('assets/images/builder.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "User Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Architect",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFFF6700),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "5 years of experience",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xFF9B9F98),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Contact Button
              const SizedBox(height: 15),

              // Bottom tab buttons
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTabButton("Portfolio", 0),
                    const SizedBox(width: 10),
                    _buildTabButton("Services", 1),
                    const SizedBox(width: 10),
                    _buildTabButton("Reviews", 2),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Content based on selected tab
              if (selectedTab == 2) _buildReviewCards(screenWidth),
              if (selectedTab == 1) _buildServiceCards(screenWidth),
              if (selectedTab == 0) _buildPortfolioGrid(screenWidth),

              // Extra spacing at bottom so ListView doesn't overlap the floating button
              const SizedBox(height: 80),
            ],
          ),

          // Floating Add Button (only for Portfolio and Services)
          if (selectedTab != 2)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  // Add your logic for Portfolio/Service button here
                },
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
        mainAxisSize: MainAxisSize.min,
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

  // ---------- Reviews Section ----------
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
                      backgroundImage: AssetImage('assets/images/i5.jpg'),
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
                          // Filled stars
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
                  "A sleek, modern hub showcasing your agency’s services, projects, and team at a glance. A sleek, modern hub showcasing your agency’s services.",
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

  // ---------- Services Section ----------
  Widget _buildServiceCards(double screenWidth) {
    return Column(
      children: List.generate(4, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5A7E8C).withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/architectt.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Architect',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Professional architectural services',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF9B9F98),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // ---------- Portfolio Section ----------
  Widget _buildPortfolioGrid(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(5, (row) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (col) {
                return Container(
                  height: 120,
                  width: (screenWidth - 40) / 3,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/design_house.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
