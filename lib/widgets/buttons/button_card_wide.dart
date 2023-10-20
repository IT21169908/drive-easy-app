part of '../widgets.g.dart';

class ButtonCardWide extends StatelessWidget {
  final String title;
  final dynamic count;
  final String asset;
  final VoidCallback? onPressed;

  const ButtonCardWide({
    super.key,
    required this.title,
    this.count,
    required this.asset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(8, 4),
            blurRadius: 25,
            spreadRadius: 0,
            color: Color(0x15000000),
          )
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed ?? () => log('Screen => $title'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, width: 85),
            const SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            count != null
                ? Text(
                    "$count",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
