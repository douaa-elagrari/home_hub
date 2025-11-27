import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; //

class HomeHeader extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const HomeHeader({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF004E98), Color.fromARGB(250, 4, 50, 96)],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_rounded,
                          size: 35,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loc.welcomeBack,
                            style: TextStyle(
                              color: Color(0xFFFF6700),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            loc.username,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 4,
                        top: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF6700),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // SEARCH BAR
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: onSearch,
                decoration: InputDecoration(
                  hintText: loc.search,
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_rounded, color: Colors.grey),
                    onPressed: () {},
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
