import '../../utils/utils.dart';

class Cardd1 extends StatefulWidget {
  const Cardd1({super.key});

  @override
  State<Cardd1> createState() => _Cardd1();
}

class _Cardd1 extends State<Cardd1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF5A7E8C).withOpacity(0.5),
              offset: const Offset(0, 3),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        height: 190,
        width: 360,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/i1.jpg'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 20.0),
                          Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "12/12/2026",
                            style: TextStyle(
                              color: Color(0xFF9B9F98),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Stars aligned to top of avatar
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const Icon(
                                  Icons.star_border,
                                  color: Color(0xFFFF6700),
                                  size: 20,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "A sleek, modern hub showcasing your agency’s services, projects, and team at a glance. A sleek, modern hub showcasing your agency’s services.",
              style: TextStyle(
                color: Color(0xFF484848),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
