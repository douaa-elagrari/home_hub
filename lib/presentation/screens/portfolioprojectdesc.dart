import 'package:flutter/material.dart';
import '/data/dummy/project.dart';
import '../widgets/descriptiontext.dart';
import '../widgets/portfolioprojectimages.dart';
import '../widgets/productinfocontainer.dart';

class ProjectLayout extends StatefulWidget {
  final int projectId;

  const ProjectLayout({super.key, required this.projectId});

  @override
  State<ProjectLayout> createState() => _ProjectLayoutState();
}

class _ProjectLayoutState extends State<ProjectLayout> {
  final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final project = projects.firstWhere((p) => p.id == widget.projectId);
    final double imageHeight = MediaQuery.of(context).size.height * 0.45;

    final double translateY = (-scrollOffset * 0.3).clamp(-80, 0);
    final double scale = (1 - scrollOffset / 800).clamp(0.9, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ======== MAIN IMAGE ========
          Transform.translate(
            offset: Offset(0, translateY),
            child: Transform.scale(
              scale: scale,
              child: Image.asset(
                project.imageUrls.first,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ======== SCROLLABLE CONTENT ========
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: imageHeight - 30),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Descriptiontext(
                        descriptionTitle: project.title,
                        descriptionParag: project.description,
                      ),
                      const SizedBox(height: 20),
                      Productinfocontainer(
                        infotitle: 'Localisation',
                        information: project.location,
                      ),
                      Productinfocontainer(
                        infotitle: 'Surface',
                        information: project.surfaceArea,
                      ),
                      const SizedBox(height: 20),
                      ImageShowroom(
                        images: project.imageUrls
                            .map((url) => AssetImage(url))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ======== BACK BUTTON ========
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
