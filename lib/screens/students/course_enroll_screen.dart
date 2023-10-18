import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme_consts.dart';

class CourseEnrollScreen extends StatefulWidget {
  const CourseEnrollScreen({super.key});

  @override
  State<CourseEnrollScreen> createState() => _CourseEnrollScreenState();
}

class _CourseEnrollScreenState extends State<CourseEnrollScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            TopAppBar(),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(201, 131, 222, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    "ABS Learner",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/images/star.svg', semanticsLabel: 'star'),
                const SizedBox(width: 5),
                Text(
                  '4.0',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff272323),
                    fontSize: 12,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light Vehicle",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Color(0xff292574)),
                  child: Text(
                    'LKR 25000.00',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/user-icon.svg'),
                    const SizedBox(width: 5),
                    Text(
                      "Lahiru Peris",
                      style: TextStyle(
                        color: Color(0xff272323),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.history_toggle_off),
                    const SizedBox(width: 5),
                    Text(
                      '4Months 3w',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(39, 35, 35, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: Color(0xffE3E3E3)),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      hintText: "Enter your full name",
                      suffixIcon: SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email or phone",
                      suffixIcon: SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Enter mobile number",
                      suffixIcon: SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "NIC",
                      hintText: "Enter NIC number",
                      suffixIcon: SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0x1492dbff),
                      border: Border.all(color: /*fileError == null ?*/ Color(0xffC2E6FF) /*: Colors.red*/),
                    ),
                    child: Row(
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                          ),
                          color: Color(0xfff1f1f1),
                          onPressed: () {},
                          child: Text(
                            "Choose file",
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int>(
                    isExpanded: true,
                    value: null,
                    items: [
                      DropdownMenuItem(
                        value: null,
                        child: Text("Choose Installment Period"),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text("1 Month"),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text("3 Month"),
                      )
                    ],
                    hint: Text("Installment Period"),
                    onChanged: (value) {},
                    dropdownColor: ThemeConsts.lightTheme.primaryColorLight,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4E74F9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: Text(
                        "PAYMENT METHOD",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
