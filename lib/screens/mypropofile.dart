import 'package:flutter/material.dart';
import 'package:homehub/screens/portfolioproviderview.dart';

class Myproprofile extends StatefulWidget {
  const Myproprofile({super.key});

  @override
  State<Myproprofile> createState() => _MyproprofileState();
}

class _MyproprofileState extends State<Myproprofile> {
  final List<String> sentences = [
    'Edit Profile',
    'Edit Portfolio',
    'Notifications',
    'Logout',
  ];

  final List<IconData> icons = [
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, size: 35),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/photodeprofile.jpg'),
              radius: 60,
            ),
            const SizedBox(height: 15),
            const Text(
              'User Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Account Type',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(sentences.length, (i) {
                return GestureDetector(
                  onTap: () {
                    if (sentences[i] == 'Edit Portfolio') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PortfolioServiceProvider(),
                        ),
                      );
                    } else if (sentences[i] == 'Logout') {
                      Navigator.pushNamed(context, '/signin_pro');
                    }
                  },
                  child: Container(
                    width: 350,
                    height: 50,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: const BorderSide(color: Colors.grey, width: 1),
                        bottom: const BorderSide(
                          color: Color(0xFF004E98),
                          width: 1,
                        ),
                        left: BorderSide(
                          color: const Color(0xFF004E98).withOpacity(0.5),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: const Color(0xFF004E98).withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF004E98).withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sentences[i],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Icon(icons[i], size: 20),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
