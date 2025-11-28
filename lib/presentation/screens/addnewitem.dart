import 'package:flutter/material.dart';
import '../widgets/addnewitemcard.dart';
import '../widgets/profileidentification.dart';

class Addnewitempage extends StatelessWidget {
  const Addnewitempage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: const [
                  Profileidentification(),
                  SizedBox(height: 20),
                  AddNewItemCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
