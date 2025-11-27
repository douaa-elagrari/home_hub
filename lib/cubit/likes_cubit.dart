import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/professional.dart';

class LikesCubit extends Cubit<List<Professional>> {
  LikesCubit() : super([]);

  // Initialize favorites with newest on top
  void setFavorites(List<Professional> favorites) {
    emit(favorites.toList());
  }

  // Add favorite with newest on top
  void addFavorite(Professional professional) {
    if (!state.contains(professional)) {
      emit([professional, ...state]);
    }
  }

  void removeFavorite(Professional professional) {
    emit(state.where((p) => p != professional).toList());
  }

  void toggleFavorite(Professional professional) {
    if (state.contains(professional)) {
      removeFavorite(professional);
    } else {
      addFavorite(professional);
    }
  }

  bool isFavorite(Professional professional) {
    return state.contains(professional);
  }
}
