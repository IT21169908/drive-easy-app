import 'dart:developer';

import 'package:flutter/material.dart';

class QuestionAnswer extends StatelessWidget {
  const QuestionAnswer({
    super.key,
    required this.answerText,
    this.onPressed,
  });

  final String answerText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(131, 134, 163, 0.11999999731779099),
            offset: Offset(0, 6),
            blurRadius: 10,
          ),
        ],
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: MaterialButton(
        onPressed: onPressed ?? () => log('Screen => Click Answer'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Center(
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff21205A),
            ),
          ),
        ),
      ),
    );
  }
}
