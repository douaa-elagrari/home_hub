import '../../utils/utils.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  final List<String> sentences = [
    'Edit Profile',
    'Notifications',
    'Switch to service provider account',
    'Logout',
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
        Navigator.pushNamed(context, '/signin');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Profile',
          style: TextStyle(
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
              // 👤 Profile image
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/photodeprofile.jpg'),
                radius: 60,
              ),
              const SizedBox(height: 15),

              // 🧍 User Name
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Account Type',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 35),

              // ⚙️ Options List
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
    );
  }
}
