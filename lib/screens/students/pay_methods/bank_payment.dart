import 'package:flutter/material.dart';

void bankPaymentModal(BuildContext context) {
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
                "Add Bank Receipt",
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
                const Text(
                  "Attach your payment proof document bellow. we will review and approve the payment. This can take 2-3 business days. ",
                  style: TextStyle(
                    color: Color(0xff474A56),
                    fontWeight: FontWeight.normal,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Bank Name",
                    hintText: "Enter your Bank name",
                    suffixIcon: SizedBox(),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0x1492dbff),
                    border: Border.all(color: /*fileError == null ?*/ const Color(0xffC2E6FF) /*: Colors.red*/),
                  ),
                  child: Row(
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                        ),
                        color: const Color(0xfff1f1f1),
                        onPressed: () {},
                        child: const Text(
                          "Choose file",
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
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
