import 'package:flutter/material.dart';
import 'package:homehub/screens/documentation_screen.dart';
import 'package:homehub/screens/homescreen.dart';
import 'package:homehub/screens/myprofile.dart';
import 'package:homehub/screens/mypropofile.dart';
import '../data/dummy_data.dart';
import '../models/professional.dart';
import '../models/product.dart';
import '../models/agency.dart';
import '../widgets/job_card.dart';
import '../widgets/product_card.dart';
import '../widgets/agency_card.dart';
import '../models/saved_item.dart';
import 'myprofile.dart';
import '../widgets/likes_tab.dart';
import '../widgets/home_header.dart';
import '../widgets/custom_bottom_nav_pro.dart';

class HomeScreenPro extends StatefulWidget {
  const HomeScreenPro({super.key});

  @override
  State<HomeScreenPro> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPro> {
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  String selectedCategory = "Services";
  String? selectedSubcategory;

  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = services; // default category
  }

  // --------- SEARCH ---------
  void _filterSearch(String query) {
    if (selectedCategory == "Services") {
      filteredList = services
          .where(
            (s) =>
                s.title.toLowerCase().contains(query.toLowerCase()) ||
                s.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else if (selectedCategory == "Products") {
      filteredList = products
          .where(
            (p) =>
                p.name.toLowerCase().contains(query.toLowerCase()) ||
                p.price.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredList = agencies
          .where(
            (a) =>
                a.title.toLowerCase().contains(query.toLowerCase()) ||
                a.location.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    setState(() {});
  }

  // ----------- CATEGORY SWITCH -----------
  void _setCategory(String category) {
    selectedCategory = category;
    selectedSubcategory = null;

    if (category == "Products") {
      filteredList = products;
    } else if (category == "Services") {
      filteredList = services;
    } else {
      filteredList = agencies;
    }

    setState(() {});
  }

  // --------- NAVIGATION BAR ----------
  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get pages => [
    HomScreen(),
    _buildHomeTab(),
    LikesTab(likedItems: likedItems,username: 'Douaa Elagrari'),
    DocumentationScreen(),
    Myproprofile()
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

  // --------HOME TAB --------
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(
            searchController: _searchController,
            onSearch: _filterSearch,
          ),

          const SizedBox(height: 20),

          // CATEGORY BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryBtn("Services"),
              const SizedBox(width: 12),
              _categoryBtn("Products"),
              const SizedBox(width: 12),
              _categoryBtn("Agencies"),
            ],
          ),

          const SizedBox(height: 20),

          // LIST OF ITEMS
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

  // --------- PRODUCT GRID ----------
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

  // Widget _buildLibraryTab() {
  //   return const Center(
  //     child: Text(
  //       "Library",
  //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }

  // ------- CATEGORY BUTTON -------
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



