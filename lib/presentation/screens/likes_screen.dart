import '../../utils/utils.dart';

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
