import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dummy_data.dart';

class HomeSearchCubit extends Cubit<List<dynamic>> {
  String selectedCategory = "Services";

  HomeSearchCubit() : super(services);

  void setCategory(String category) {
    selectedCategory = category;

    if (category == "Services") {
      emit(services);
    } else if (category == "Products") {
      emit(products);
    } else {
      emit(agencies);
    }
  }

  void search(String query) {
    List<dynamic> list;

    if (selectedCategory == "Services") {
      list = services
          .where(
            (s) =>
                s.title.toLowerCase().contains(query.toLowerCase()) ||
                s.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else if (selectedCategory == "Products") {
      list = products
          .where(
            (p) =>
                p.name.toLowerCase().contains(query.toLowerCase()) ||
                p.price.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      list = agencies
          .where(
            (a) =>
                a.title.toLowerCase().contains(query.toLowerCase()) ||
                a.location.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    emit(list);
  }
}
