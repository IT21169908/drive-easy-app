import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    print("Find learners");
                  },
                  text: "Find learners",
                  fontSize: 14,
                ),
            ],
          ),
          if (isCourseEnrolled)
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
              decoration: BoxDecoration(
                color: Color(0xff0029BA),
                image: const DecorationImage(
                  image: AssetImage('assets/images/card-decoration.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment(1, 0),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Light Vehicle",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "ABS Learners",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Color.fromRGBO(201, 131, 222, 0.75),
                        ),
                        child: Text(
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
                  SvgPicture.asset("assets/images/enrolled-course-card-girl.svg")
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
                  DashboardGridItem(
                    title: "Find Schools",
                    count: "200 learners",
                    asset: "assets/images/learning.png",
                  ),
                if (isCourseEnrolled)
                  DashboardGridItem(
                    title: "Track Vehicles",
                    count: "4 Vehicles",
                    asset: "assets/images/tracking-vehicles.png",
                  ),
                DashboardGridItem(
                  title: "Tutorials", //TODO: Add relevant feature
                  count: "15 Courses",
                  asset: "assets/images/tools.png",
                ),
                DashboardGridItem(
                  title: "Blog & News", //TODO: Add relevant feature
                  count: "42 Articles",
                  asset: "assets/images/action.png",
                ),
                if (!isCourseEnrolled)
                  DashboardGridItem(
                    title: "Contact Us", //TODO: Add relevant feature
                    count: "24hr Support",
                    asset: "assets/images/agent.png",
                  ),
                if (isCourseEnrolled) ...[
                  DashboardGridItem(
                    title: "My Progress", //TODO: Add relevant feature
                    count: "2 Tasks pending",
                    asset: "assets/images/progress.png",
                  ),
                  DashboardGridItem(
                    title: "Payments", //TODO: Add relevant feature
                    count: "2 Invoices",
                    asset: "assets/images/payments.png",
                  ),
                  DashboardGridItem(
                    title: "My Exams", //TODO: Add relevant feature
                    count: "3 MCQ Exams",
                    asset: "assets/images/exam.png",
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}