// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../utils/utils.dart';

// class Myproprofile extends StatefulWidget {
//   const Myproprofile({super.key});

//   @override
//   State<Myproprofile> createState() => _MyProfileState();
// }

// class _MyProfileState extends State<Myproprofile> {
//   final List<String> sentences = [
//     'Edit Profile',
//     'Edit Portfolio',
//     'Notifications',
//     'Logout',
//   ];

//   final List<IconData> icons = [
//     Icons.arrow_forward,
//     Icons.arrow_forward,
//     Icons.arrow_forward,
//     Icons.logout,
//   ];

//   String username = "User Name"; // default username

//   @override
//   void initState() {
//     super.initState();
//     loadUsername();
//   }

//   // Load username from SharedPreferences
//   Future<void> loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       username = prefs.getString('logged_username') ?? "User Name";
//     });
//   }

//   // Logout: remove logged_username from storage
//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('logged_username'); // destroy logged-in storage
//     setState(() {
//       username = "User Name"; // reset username
//     });
//     // Navigate to welcome screen and remove all previous routes
//     Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.chevron_left, size: 35),
//         ),
//         title: const Text(
//           'My Profile',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/photodeprofile.jpg'),
//               radius: 60,
//             ),
//             const SizedBox(height: 15),
//             Text(
//               username, // display real username
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const Text(
//               'Account Type',
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             Column(
//               children: List.generate(sentences.length, (i) {
//                 return GestureDetector(
//                   onTap: () {
//                     if (sentences[i] == 'Logout') {
//                       logout(); // call logout function
//                     } else if (sentences[i] == 'Edit Portfolio') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const PortfolioServiceProvider(),
//                         ),
//                       );
//                     }
//                   },
//                   child: Container(
//                     width: 350,
//                     height: 50,
//                     margin: const EdgeInsets.all(5),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 15,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border(
//                         top: const BorderSide(color: Colors.grey, width: 1),
//                         bottom: const BorderSide(
//                           color: Color(0xFF004E98),
//                           width: 1,
//                         ),
//                         left: BorderSide(
//                           color: const Color(0xFF004E98).withOpacity(0.5),
//                           width: 1,
//                         ),
//                         right: BorderSide(
//                           color: const Color(0xFF004E98).withOpacity(0.5),
//                           width: 1,
//                         ),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF004E98).withOpacity(0.3),
//                           spreadRadius: 0,
//                           blurRadius: 2,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           sentences[i],
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                           ),
//                         ),
//                         Icon(icons[i], size: 20),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehub/logic/cubit/myproprofile_cubit.dart';
import '../../utils/utils.dart';

class Myproprofile extends StatelessWidget {
  const Myproprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyProProfileCubit()..loadUsername(),
      child: BlocBuilder<MyProProfileCubit, MyProProfile>(
        builder: (context, state) {
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

          void handleAction(String action) {
            if (action == 'Logout') {
              context.read<MyProProfileCubit>().logout();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/welcome', (route) => false);
            } else if (action == 'Edit Portfolio') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PortfolioServiceProvider(),
                ),
              );
            }
          }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
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
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/photodeprofile.jpg'),
                    radius: 60,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.username.isNotEmpty
                        ? state.username
                        : "User Name", // display real username
                    style: const TextStyle(
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
                        onTap: () => handleAction(sentences[i]),
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
                              top: const BorderSide(
                                  color: Colors.grey, width: 1),
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
                                color:
                                    const Color(0xFF004E98).withOpacity(0.3),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
