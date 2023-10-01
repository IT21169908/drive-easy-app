import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/bg-decoration.png'),
                fit: BoxFit.contain,
                alignment: Alignment(-1, -1),
              ),
              color: const Color(0xff4E74F9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.dmSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            color: const Color(0xffffffff),
                          ),
                          children: [
                            TextSpan(
                              text: 'Hello\n',
                              style: GoogleFonts.dmSans(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                height: 1.04,
                                color: const Color(0xffffffff),
                              ),
                            ),
                            TextSpan(
                              text: getGreeting(),
                              style: GoogleFonts.dmSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.6,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8, top: 0),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SearchBar(
                    elevation: const MaterialStatePropertyAll(0),
                    hintText: "Search",
                    padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 16.0, right: 4)),
                    constraints: const BoxConstraints(maxHeight: 50),
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Filters',
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_forward_ios_sharp),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Our Services',
              textAlign: TextAlign.left,
              style: GoogleFonts.rubik(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 24,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 4, right: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // childAspectRatio: width/height
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 170,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                dashboardGridItem(
                  title: "Find Schools",
                  count: "200 learners",
                  asset: "assets/images/learning.png",
                ),
                dashboardGridItem(
                  title: "Tutorials",
                  count: "15 Courses",
                  asset: "assets/images/tools.png",
                ),
                dashboardGridItem(
                  title: "Blog & News",
                  count: "42 Articles",
                  asset: "assets/images/action.png",
                ),
                dashboardGridItem(
                  title: "Contact Us",
                  count: "24hr Support",
                  asset: "assets/images/agent.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget dashboardGridItem({required String title, dynamic count, required String asset}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          offset: Offset(8, 4),
          blurRadius: 25,
          spreadRadius: 0,
          color: Color(0x15000000),
        )
      ],
    ),
    child: MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: 85,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "$count",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
