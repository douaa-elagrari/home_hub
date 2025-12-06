import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/utils.dart';
import 'dart:io';
import '../../data/repositories/user_repo.dart';
import '../../l10n/app_localizations.dart';

class Myproprofile extends StatefulWidget {
  const Myproprofile({super.key});

  @override
  State<Myproprofile> createState() => _MyproprofileState();
}

class _MyproprofileState extends State<Myproprofile> {
  final List<IconData> icons = [
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.logout,
  ];

  String username = "User Name";
  String? profilePicture;
  String accountType = "normal";

  final UserRepo _repo = UserRepo.getInstance();

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('logged_username') ?? "User Name";
    });

    await loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedUsername = prefs.getString('logged_username');

      if (savedUsername == null || savedUsername.isEmpty) return;

      final user = await _repo.getUserByUsername(savedUsername);

      if (user != null) {
        setState(() {
          profilePicture = user.profilePicture;
          accountType = user.userType;
        });
      }
    } catch (e) {
      print("Error loading profile data: $e");
    }
  }

  String getAccountTypeDisplay(AppLocalizations loc) {
    switch (accountType.toLowerCase()) {
      case 'company':
        return loc.companyAccount;
      case 'freelancer':
        return loc.freelancerAccount;
      case 'normal':
        return loc.normalAccount;
      default:
        return loc.userAccount;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

    final List<String> sentences = [
      loc.editProfile,
      loc.notifications,
      loc.switchToServiceProviderAccount,
      loc.logout,
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            loc.myProfile,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfilePicture(), // keep your profile picture method
                const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    getAccountTypeDisplay(loc),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
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
                            color: const Color(0xFF004E98).withOpacity(0.15),
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
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    if (profilePicture != null && profilePicture!.isNotEmpty) {
      if (profilePicture!.startsWith('http')) {
        return CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(profilePicture!),
          onBackgroundImageError: (_, __) {},
        );
      }

      final file = File(profilePicture!);
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
