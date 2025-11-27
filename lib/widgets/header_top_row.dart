import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // import localization

class HeaderTopRow extends StatelessWidget {
  final String username;

  const HeaderTopRow({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // get localized strings

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
                  username,
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
