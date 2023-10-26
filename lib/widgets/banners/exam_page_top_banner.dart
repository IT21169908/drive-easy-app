import 'package:flutter/material.dart';

class ExamPageTopBanner extends StatelessWidget {
  final Widget child;

  const ExamPageTopBanner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 109.42888641357422,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(25),
        ),
        color: Color.fromRGBO(70, 30, 185, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -20,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/exam-bg-banner-decoration-3.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: 60,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/exam-bg-banner-decoration-2.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: 0,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/exam-bg-banner-decoration-1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
