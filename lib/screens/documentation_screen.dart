// import 'package:flutter/material.dart';
// import '../../widgets/home_header.dart';

// class DocumentationScreen extends StatefulWidget {
//   const DocumentationScreen({super.key});

//   @override
//   State<DocumentationScreen> createState() => _DocumentationScreenState();
// }

// class _DocumentationScreenState extends State<DocumentationScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   final List<Map<String, String>> items = [
//     {
//       "image": "assets/images/memorial_of_martyr.png",
//       "title": "Santa-cruz -31",
//       "description": "Amina Benhmed",
//     },
//     {
//       "image": "assets/images/santa_cruz.png",
//       "title": "Santa-cruz -31",
//       "description": "Yacine Talbi",
//     },
//     {
//       "image": "assets/images/memorial_of_martyr.png",
//       "title": "Santa-cruz -31",
//       "description": "Dalia Lili",
//     },
//     {
//       "image": "assets/images/santa_cruz.png",
//       "title": "hydra -16",
//       "description": "Samia Hachour",
//     },
//     {
//       "image": "assets/images/memorial_of_martyr.png",
//       "title": "Santa-cruz -31",
//       "description": "Alia Hamadouch",
//     },
//     {
//       "image": "assets/images/santa_cruz.png",
//       "title": "Ben-Aknoun -16",
//       "description": "Samir kachour",
//     },
//     {
//       "image": "assets/images/memorial_of_martyr.png",
//       "title": "Santa-cruz -31",
//       "description": "Ahmed Ali",
//     },
//     {
//       "image": "assets/images/santa_cruz.png",
//       "title": "Sidi Abdellah, -16",
//       "description": "Hassiba Ben",
//     },
//     {
//       "image": "assets/images/memorial_of_martyr.png",
//       "title": "Santa-cruz -31",
//       "description": "Lilia Salem",
//     },
//   ];

//   List<Map<String, String>> filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredItems = items;

//     // Filter items as user types
//     _searchController.addListener(() {
//       final query = _searchController.text.toLowerCase();
//       setState(() {
//         if (query.isEmpty) {
//           filteredItems = items;
//         } else {
//           filteredItems = items.where((item) {
//             final title = item['title']!.toLowerCase();
//             final desc = item['description']!.toLowerCase();
//             return title.contains(query) || desc.contains(query);
//           }).toList();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           HomeHeader(
//             searchController: _searchController,
//             onSearch:
//                 (query) {}, // not needed because listener handles filtering
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GridView.builder(
//                 itemCount: filteredItems.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 0.8,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = filteredItems[index];
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 6,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 63,
//                           height: 63,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: AssetImage(item["image"]!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           item["title"]!,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           item["description"]!,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_header.dart';
import '../cubit/search_documentation_cubit.dart';

class DocumentationScreen extends StatelessWidget {
  DocumentationScreen({super.key});

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Amina Benhmed",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Santa-cruz -31",
      "description": "Yacine Talbi",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Dalia Lili",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "hydra -16",
      "description": "Samia Hachour",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Alia Hamadouch",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Ben-Aknoun -16",
      "description": "Samir kachour",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Ahmed Ali",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Sidi Abdellah, -16",
      "description": "Hassiba Ben",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Lilia Salem",
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchDocumentationCubit(allItems: items),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BlocBuilder<SearchDocumentationCubit, List<Map<String, String>>>(
              builder: (context, state) {
                return HomeHeader(
                  searchController: _searchController,
                  onSearch: (query) {
                    context.read<SearchDocumentationCubit>().search(query);
                  },
                );
              },
            ),
            Expanded(
              child:
                  BlocBuilder<
                    SearchDocumentationCubit,
                    List<Map<String, String>>
                  >(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          itemCount: state.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.8,
                              ),
                          itemBuilder: (context, index) {
                            final item = state[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(item["image"]!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item["title"]!,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item["description"]!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
