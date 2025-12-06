import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehub/logic/cubit/service_state.dart';
import 'package:homehub/presentation/screens/addnewservice.dart';
import 'package:homehub/logic/cubit/myprofile_cubit.dart';
import 'package:homehub/logic/cubit/service_cubit.dart';

class PortfolioServiceProvider extends StatefulWidget {
  const PortfolioServiceProvider({super.key});

  @override
  State<PortfolioServiceProvider> createState() =>
      _PortfolioServiceProviderState();
}

class _PortfolioServiceProviderState extends State<PortfolioServiceProvider> {
  int selectedTab = 0; // 0 = Portfolio, 1 = Services, 2 = Reviews

  void selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Create cubits locally like the working code
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyProfileCubit()..loadUsername()),
        BlocProvider(create: (_) => ServiceCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              children: [
                // Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Avatar & Profile Info
                BlocBuilder<MyProfileCubit, MyProfileState>(
                  builder: (context, state) {
                    // Load services when username is available
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (state.username.isNotEmpty) {
                        context.read<ServiceCubit>().loadServicesForUser(
                          state.username,
                        );
                      }
                    });

                    return Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 65,
                            backgroundImage: AssetImage(
                              'assets/images/builder.png',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Service Provider",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFF6700),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "5 years of experience",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9B9F98),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                // Tab Buttons
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTabButton("Portfolio", 0),
                      const SizedBox(width: 10),
                      _buildTabButton("Services", 1),
                      const SizedBox(width: 10),
                      _buildTabButton("Reviews", 2),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Dynamic Content
                if (selectedTab == 2) _buildReviewCards(screenWidth),
                if (selectedTab == 1) _buildServiceCards(),
                if (selectedTab == 0) _buildPortfolioGrid(),

                const SizedBox(height: 80),
              ],
            ),

            // Floating Add Button
            if (selectedTab == 1 || selectedTab == 0)
              Positioned(
                bottom: 20,
                right: 20,
                child: BlocBuilder<MyProfileCubit, MyProfileState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: context.read<ServiceCubit>(),
                              child: const Addnewservicepage(),
                            ),
                          ),
                        );
                      },
                      backgroundColor: const Color(0xFF004E98),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ----------------- TAB BUTTON -----------------
  Widget _buildTabButton(String title, int index) {
    return ElevatedButton(
      onPressed: () => selectTab(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(110, 40),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 70,
            color: selectedTab == index
                ? const Color(0xFF004E98)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // ----------------- SERVICES LIST (DYNAMIC) -----------------
  Widget _buildServiceCards() {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ServiceError) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (state is ServiceLoaded) {
          final services = state.services;

          if (services.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "No services added yet.",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5A7E8C).withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/images/architectt.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              service.description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9B9F98),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }

  // ----------------- REVIEWS (STATIC) -----------------
  Widget _buildReviewCards(double screenWidth) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5A7E8C).withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          height: 190,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/i5.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFF6700),
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "A sleek, modern hub showcasing your agency's services, projects, and team at a glance. A sleek, modern hub showcasing your agency's services.",
                  style: TextStyle(color: Color(0xFF484848), fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ----------------- PORTFOLIO GRID (FIXED) -----------------
  Widget _buildPortfolioGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 15, // 5 rows × 3 columns
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/design_house.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}