import 'package:flutter/material.dart';
import 'package:homehub/data/repositories/agency_repo.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = "Services";
  String? selectedSubcategory;
  List<dynamic> filteredList = [];
  List<Agency> agenciesList = []; // hold agencies from DB

  @override
  void initState() {
    super.initState();
    _setCategory(selectedCategory); // initialize filtered list
    loadAgenciesFromDB(); // load agencies from DB
  }

  Future<void> loadAgenciesFromDB() async {
    agenciesList = await AgencyDBRepo().getAllAgencies();
    if (selectedCategory == "Agencies") {
      filteredList = agenciesList;
    }
    setState(() {});
  }

  void _filterSearch(String query) {
    query = query.toLowerCase();
    setState(() {
      if (selectedCategory == "Services") {
        filteredList = services
            .where(
              (s) =>
                  s.title.toLowerCase().contains(query) ||
                  s.name.toLowerCase().contains(query),
            )
            .toList();
      } else if (selectedCategory == "Products") {
        filteredList = products
            .where(
              (p) =>
                  p.name.toLowerCase().contains(query) ||
                  p.price.toLowerCase().contains(query),
            )
            .toList();
      } else {
        filteredList = agenciesList
            .where(
              (a) =>
                  a.title.toLowerCase().contains(query) ||
                  a.location.toLowerCase().contains(query),
            )
            .toList();
      }
    });
  }

  void _setCategory(String categoryText) {
    setState(() {
      selectedCategory = categoryText;
      selectedSubcategory = null;

      if (categoryText == "Services") {
        filteredList = services;
      } else if (categoryText == "Products") {
        filteredList = products;
      } else {
        filteredList = agenciesList;
      }
    });
  }

  void _onNavBarTap(int index) {
    setState(() => _selectedIndex = index);
  }

  List<Widget> get pages => [
    HomScreen(),
    _buildHomeTab(),
    LikesTab(likedItems: likedItems, username: 'Douaa Elagrari'),
    Myprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildHomeTab() {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(
            searchController: _searchController,
            onSearch: _filterSearch,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryBtn(loc.services),
              const SizedBox(width: 12),
              _categoryBtn(loc.products),
              const SizedBox(width: 12),
              _categoryBtn(loc.agencies),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: selectedCategory == "Products"
                ? _buildProductGrid()
                : selectedCategory == "Services"
                ? Column(
                    children: filteredList
                        .map((p) => JobCard(professional: p))
                        .toList(),
                  )
                : Column(
                    children: filteredList
                        .map((a) => AgencyCard(agency: a))
                        .toList(),
                  ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) => ProductCard(product: filteredList[i]),
    );
  }

  Widget _categoryBtn(String text) {
    bool selected = selectedCategory == text;
    return OutlinedButton(
      onPressed: () => _setCategory(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: selected ? const Color(0xFF004E98) : Colors.grey,
          width: 2,
        ),
        backgroundColor: const Color(0xFFE2E2E2),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
