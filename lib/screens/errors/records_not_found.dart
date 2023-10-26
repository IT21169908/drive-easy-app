import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
    this.title = 'Add a record first.',
    this.subtitle = "Sorry, we couldn't find any records. \nPlease try again.",
    this.child,
  });

  final String title;

  final String subtitle;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/clip-arts/404.svg',
              width: 300,
              semanticsLabel: 'Records Not Found',
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 304,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // addamedicalrecordv2B (1:1560)
                    margin: const EdgeInsets.fromLTRB(0, 0, 1, 8),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.185,
                        letterSpacing: -0.3000000119,
                        color: const Color(0xff222222),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 304,
                    ),
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.3000000119,
                        color: const Color(0xff677294),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (child != null)
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: child!,
              )
          ],
        ),
      ),
    );
  }
}
