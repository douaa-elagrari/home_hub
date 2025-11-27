// import 'package:flutter/material.dart';
// import '../models/saved_item.dart';      
// import '../models/product.dart';
// import '../models/professional.dart';
// import '../models/agency.dart';
// import '../widgets/product_card.dart';
// import '../widgets/job_card.dart';
// import '../widgets/agency_card.dart';

// class LikesTab extends StatelessWidget {
//   final List<SavedItem> likedItems;

//   const LikesTab({
//     Key? key,
//     required this.likedItems,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(top: 90, left: 16, right: 16, bottom: 20),
//       child: likedItems.isEmpty
//           ? const Center(child: Text("No favorites yet!"))
//           : Column(
//               children: likedItems.map((saved) {
//                 if (saved.type == SavedType.product) {
//                   return ProductCard(product: saved.item as Product);
//                 }

//                 if (saved.type == SavedType.service) {
//                   return JobCard(professional: saved.item as Professional);
//                 }

//                 return AgencyCard(agency: saved.item as Agency);
//               }).toList(),
//             ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import '../models/saved_item.dart';      
// import '../models/product.dart';
// import '../models/professional.dart';
// import '../models/agency.dart';
// import '../widgets/product_card.dart';
// import '../widgets/job_card.dart';
// import '../widgets/agency_card.dart';
// import '../widgets/header_top_row.dart';

// class LikesTab extends StatelessWidget {
//   final List<SavedItem> likedItems;

//   const LikesTab({
//     Key? key,
//     required this.likedItems,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Fixed Header
//         Container(
//           padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
//           child: const HeaderTopRow(username: "Username"),
//         ),

//         const SizedBox(height: 20),

//         // Expanded list
//         Expanded(
//           child: likedItems.isEmpty
//               ? const Center(child: Text("No favorites yet!"))
//               : ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: likedItems.length,
//                   itemBuilder: (context, index) {
//                     final saved = likedItems[index];

//                     Widget card;
//                     if (saved.type == SavedType.product) {
//                       card = ProductCard(product: saved.item as Product);
//                     } else if (saved.type == SavedType.service) {
//                       card = JobCard(professional: saved.item as Professional);
//                     } else {
//                       card = AgencyCard(agency: saved.item as Agency);
//                     }

//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 16),
//                       child: SizedBox(
//                         width: double.infinity, // make card full width
//                         child: card,
//                       ),
//                     );
//                   },
//                 ),
//         ),
//       ],
//     );
//   }
// }





import 'package:flutter/material.dart';
import '../models/saved_item.dart';      
import '../models/product.dart';
import '../models/professional.dart';
import '../models/agency.dart';
import '../widgets/product_card.dart';
import '../widgets/job_card.dart';
import '../widgets/agency_card.dart';
import '../widgets/header_top_row.dart';
import '../l10n/app_localizations.dart';

class LikesTab extends StatelessWidget {
  final List<SavedItem> likedItems;
  final String username; // dynamic username

  const LikesTab({
    Key? key,
    required this.likedItems,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // <-- get localized strings

    return Column(
      children: [
        // Fixed Header
        Container(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: HeaderTopRow(username: username),
        ),

        const SizedBox(height: 20),

        // Expanded list of cards
        Expanded(
          child: likedItems.isEmpty
              ? Center(
                  child: Text(
                    loc.noFavoritesYet, // <-- localized "No favorites yet!"
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: likedItems.length,
                  itemBuilder: (context, index) {
                    final saved = likedItems[index];

                    Widget card;
                    if (saved.type == SavedType.product) {
                      card = ProductCard(product: saved.item as Product);
                    } else if (saved.type == SavedType.service) {
                      card = JobCard(professional: saved.item as Professional);
                    } else {
                      card = AgencyCard(agency: saved.item as Agency);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: card,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}