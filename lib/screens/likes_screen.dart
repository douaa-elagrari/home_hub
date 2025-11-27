import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/job_card.dart';
import '../models/professional.dart';
import '../widgets/header_top_row.dart';
import '../cubit/likes_cubit.dart';

class LikesScreen extends StatelessWidget {
  final List<Professional> initialFavorites;

  const LikesScreen({super.key, required this.initialFavorites});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LikesCubit()..setFavorites(initialFavorites),
      child: BlocBuilder<LikesCubit, List<Professional>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(child: Text("No favorites yet!"));
          }

          return Scaffold(
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              itemCount: favorites.length,
              itemBuilder: (_, index) {
                final p = favorites[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: JobCard(professional: p),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
