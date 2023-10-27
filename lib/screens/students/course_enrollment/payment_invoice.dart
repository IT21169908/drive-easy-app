import 'package:drive_easy_app/screens/students/layouts/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/app_routes.dart';


class PaymentInvoiceScreen extends StatefulWidget {
  const PaymentInvoiceScreen({super.key});

  @override
  State<PaymentInvoiceScreen> createState() => _PaymentInvoiceScreenState();
}

class _PaymentInvoiceScreenState extends State<PaymentInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 255,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-decoration.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment(-1, -1),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Color.fromRGBO(78, 116, 249, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/payment-success-icon.svg', semanticsLabel: 'ellipse187'),
                  const SizedBox(height: 10),
                  const Text(
                    'Your payment\nwas successful!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Payment Details",
                    style: TextStyle(
                      color: Color(0xff474A56),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "COURSE",
                    style: TextStyle(
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    "Light Vehicle",
                    style: TextStyle(
                      color: Color(0xff474A56),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(200, 209, 225, 1),
                    thickness: 0.5,
                    height: 30,
                  ),
                  const Text(
                    "TRANSACTION NUMBER",
                    style: TextStyle(
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    "193321453667",
                    style: TextStyle(
                      color: Color(0xff474A56),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(200, 209, 225, 1),
                    thickness: 0.5,
                    height: 30,
                  ),
                  const Text(
                    "PAYMENT METHOD",
                    style: TextStyle(
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/master-card.svg',
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "**** **** **** 1234",
                        style: TextStyle(
                          color: Color(0xff474A56),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromRGBO(200, 209, 225, 1),
                    thickness: 0.5,
                    height: 30,
                  ),
                  const Text(
                    "AMOUNT",
                    style: TextStyle(
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    "LKR 25,600.00",
                    style: TextStyle(
                      color: Color(0xff474A56),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(200, 209, 225, 1),
                    thickness: 0.5,
                    height: 30,
                  ),
                  const Text(
                    "PAYMENT DATE",
                    style: TextStyle(
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    "15 OCT 2023, 10:30 AM",
                    style: TextStyle(
                      color: Color(0xff474A56),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4E74F9),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "SAVE PDF",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const StudentDashboardLayout();
                                  },
                                ),
                                (_) => false,
                              );
                              //Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CourseEnrollScreen()), (route) => false);
                              persistentTabController.jumpToTab(0);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white, // Transparent background
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: const BorderSide(
                                    color: Color.fromRGBO(51, 77, 143, 1),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              child: Text(
                                "DASHBOARD",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 77, 143, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
