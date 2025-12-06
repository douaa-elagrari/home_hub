import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehub/logic/cubit/myprofile_cubit.dart';
import 'dart:io';
import '../../l10n/app_localizations.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => MyProfileCubit()..loadUsername(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            loc.myProfile,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<MyProfileCubit, MyProfileState>(
            builder: (context, state) {
              final List<String> sentences = [
                loc.editProfile,
                loc.notifications,
                loc.switchToServiceProviderAccount,
                loc.logout,
              ];

              final List<IconData> icons = [
                Icons.arrow_forward_ios_rounded,
                Icons.notifications_active_outlined,
                Icons.swap_horiz_rounded,
                Icons.logout_rounded,
              ];

              void handleAction(int index) {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/welcome');
                    break;
                }
              }

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildProfilePicture(
                        state.profilePicture,
                        state.username,
                      ),
                      const SizedBox(height: 15),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          state.username,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          context
                              .read<MyProfileCubit>()
                              .getAccountTypeDisplay(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Column(
                        children: List.generate(sentences.length, (i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF004E98).withOpacity(0.4),
                                width: 1.2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF004E98,
                                  ).withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 2,
                              ),
                              title: Text(
                                sentences[i],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              trailing: IconButton(
                                icon: Icon(
                                  icons[i],
                                  size: 22,
                                  color: const Color(0xFF004E98),
                                ),
                                onPressed: () => handleAction(i),
                              ),
                              onTap: () => handleAction(i),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(String? profilePicturePath, String username) {
    if (profilePicturePath != null && profilePicturePath.isNotEmpty) {
      if (profilePicturePath.startsWith('http')) {
        return CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(profilePicturePath),
          onBackgroundImageError: (_, __) {},
        );
      }
      final file = File(profilePicturePath);
      if (file.existsSync()) {
        return CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          backgroundImage: FileImage(file),
        );
      }
    }
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/photodeprofile.jpg'),
      radius: 60,
    );
  }
}

