import 'package:drive_easy_app/widgets/banners/exam_page_top_banner.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExamDashboardScreen extends StatefulWidget {
  const ExamDashboardScreen({super.key});

  @override
  State<ExamDashboardScreen> createState() => _ExamDashboardScreenState();
}

class _ExamDashboardScreenState extends State<ExamDashboardScreen> {
  late final User? loggedUser;

  @override
  void initState() {
    loggedUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const TopAppBar(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffFFC858),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(95, 95, 95, 0.10000000149011612),
                          offset: Offset(0, 3),
                          blurRadius: 12,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          loggedUser?.photoURL ?? 'https://robohash.org/user',
                        ),
                        fit: BoxFit.fitWidth,
                        onError: (error, stackTrace) {
                          if (kDebugMode) {
                            print(":::::::::::::::::::::::: DecorationImage => ${loggedUser?.photoURL} | onError: ${error.toString()}");
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Color(0xff27093E),
                        ),
                      ),
                      Text(
                        loggedUser?.displayName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff27093E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ExamPageTopBanner(
                child: Center(
                  child: Text(
                    "09 : 12 : 12",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
