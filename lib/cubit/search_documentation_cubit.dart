import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDocumentationCubit extends Cubit<List<Map<String, String>>> {
  final List<Map<String, String>> allItems;

  SearchDocumentationCubit({required this.allItems}) : super(allItems);

  void search(String query) {
    if (query.isEmpty) {
      emit(allItems);
    } else {
      emit(allItems.where((item) {
        final title = item['title']!.toLowerCase();
        final desc = item['description']!.toLowerCase();
        return title.contains(query.toLowerCase()) || desc.contains(query.toLowerCase());
      }).toList());
    }
  }
}
