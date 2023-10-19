import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void onlinePaymentModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                "Add Credit Card",
                style: TextStyle(
                  color: Color(0xff3E3E3F),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  icon: const Icon(Icons.close),
                  color: const Color(0xffbcbcbc),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "16 digits number",
                    hintText: "1234 5678 9012 1234",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        'assets/images/master-card.svg',
                        width: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Expiration date",
                          hintText: "MM / YY",
                          suffixIcon: SizedBox(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "CVV / CVC",
                          hintText: "***",
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.help_outline_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    const Text(
                      "Save this payment method?",
                      style: TextStyle(
                        color: Color(0xff474A56),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4E74F9),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "ADD",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
