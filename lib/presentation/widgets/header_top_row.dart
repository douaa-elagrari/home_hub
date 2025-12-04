import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/utils.dart';

class HeaderTopRow extends StatefulWidget {
  const HeaderTopRow({super.key});

  @override
  State<HeaderTopRow> createState() => _HeaderTopRowState();
}

class _HeaderTopRowState extends State<HeaderTopRow> {
  String username = "";

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('logged_username') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // localized strings

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Material(
              elevation: 1,
              shape: const CircleBorder(),
              shadowColor: Colors.black54,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 35, color: Colors.grey),
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.welcomeBack,
                  style: const TextStyle(
                    color: Color(0xFFFF6700),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  username.isNotEmpty
                      ? username
                      : loc.username, // dynamic username
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),

        const Icon(
          Icons.notifications_outlined,
          color: Color(0xFFFF6700),
          size: 30,
        ),
      ],
    );
  }
}
