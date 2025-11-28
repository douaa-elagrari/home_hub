import 'package:flutter/material.dart';
import '../widgets/passtoprocard.dart';

class Passetoproaccountpage extends StatelessWidget {
  const Passetoproaccountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: const PasseToProCard(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
