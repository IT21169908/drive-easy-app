import 'package:drive_easy_app/screens/students/pay_methods/bank_payment.dart';
import 'package:drive_easy_app/screens/students/pay_methods/online_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.g.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAppBar(),
              const SizedBox(height: 20),
              Text(
                "Choose Payment Method",
                style: GoogleFonts.inter(
                  color: Color(0xff3E3E3F),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Choose your preferred payment method",
                style: GoogleFonts.inter(
                  color: Color(0xff3E3E3F),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    width: 1,
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    onlinePaymentModal(context);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/pay-method-card.svg', semanticsLabel: 'pay-method-card'),
                      const SizedBox(width: 10),
                      Text(
                        'Online Payment',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          color: Color.fromRGBO(62, 62, 63, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    width: 1,
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    bankPaymentModal(context);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/pay-method-card.svg', semanticsLabel: 'pay-method-card'),
                      const SizedBox(width: 10),
                      Text(
                        'Bank Transfer',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          color: Color.fromRGBO(62, 62, 63, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Please review the details below",
                style: GoogleFonts.inter(
                  color: Color(0xff3E3E3F),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color.fromRGBO(229, 229, 229, 1),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/receipt.svg', semanticsLabel: 'receipt'),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                'Light Vehicle',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                  color: Color.fromRGBO(62, 62, 63, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'LKR 25,000.00',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                  color: Color.fromRGBO(62, 62, 63, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Navod Hansajith',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Course',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Light Vehicle',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Course Fee',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'LKR 25,000.00',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Tax',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'LKR 100.00',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Document Fee',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'LKR 500.00',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Total Amount',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'LKR 25,600.00',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(62, 62, 63, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
