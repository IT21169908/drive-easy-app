import 'package:drive_easy_app/screens/students/course_contents/view_course_content_screen.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/track_vehicles_screen.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
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

  // bool isCourseEnrolled = false;
  //
  bool isCourseEnrolled = true;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Our Services',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 24,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              if (isCourseEnrolled)
                AppTextButton(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  onPressed: () {
                    if (kDebugMode) {
                      print("Find learners");
                    }
                  },
                  text: "Find learners",
                  fontSize: 14,
                ),
            ],
          ),
          if (isCourseEnrolled)
            ScreenTopBanner(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
              image: SvgPicture.asset("assets/images/enrolled-course-card-girl.svg"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Light Vehicle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "ABS Learners",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewCourseContentScreen()));
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ViewCourseContentScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                      );
                    },
                    elevation: 0,
                    color: const Color(0xBFC983DE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "View",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 4, right: 4, top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // childAspectRatio: width/height
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 170,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              padding: const EdgeInsets.symmetric(vertical: 5),
              children: [
                if (!isCourseEnrolled)
                  const ButtonCard(
                    title: "Find Schools",
                    count: "200 learners",
                    asset: "assets/images/learning.png",
                  ),
                if (isCourseEnrolled)
                  ButtonCard(
                    title: "Vehicle Tracking",
                    count: "4 Vehicles",
                    asset: "assets/images/tracking-vehicles.png",
                    onPressed: () async {
                      await PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const TrackVehiclesScreen(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.scale,
                      );
                    },
                  ),
                const ButtonCard(
                  title: "Tutorials", //TODO: Add relevant feature
                  count: "15 Courses",
                  asset: "assets/images/tools.png",
                ),
                const ButtonCard(
                  title: "Blog & News", //TODO: Add relevant feature
                  count: "42 Articles",
                  asset: "assets/images/action.png",
                ),
                if (!isCourseEnrolled)
                  const ButtonCard(
                    title: "Contact Us", //TODO: Add relevant feature
                    count: "24hr Support",
                    asset: "assets/images/agent.png",
                  ),
                if (isCourseEnrolled) ...[
                  const ButtonCard(
                    title: "My Progress", //TODO: Add relevant feature
                    count: "2 Tasks pending",
                    asset: "assets/images/progress.png",
                  ),
                  const ButtonCard(
                    title: "Payments", //TODO: Add relevant feature
                    count: "2 Invoices",
                    asset: "assets/images/payments.png",
                  ),
                  const ButtonCard(
                    title: "My Exams", //TODO: Add relevant feature
                    count: "3 MCQ Exams",
                    asset: "assets/images/exam.png",
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
