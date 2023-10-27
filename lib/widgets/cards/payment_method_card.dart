import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key, this.onPressed, required this.text, required this.image, this.textStyle});

  final Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFF4F4F4),
          width: 1,
        ),
        color: const Color(0xFFF4F4F4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            image,
            const SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.left,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
