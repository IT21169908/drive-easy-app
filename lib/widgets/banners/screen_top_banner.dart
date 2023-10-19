part of '../widgets.g.dart';

class ScreenTopBanner extends StatelessWidget {
  final String title;
  final String assets;

  const ScreenTopBanner({
    super.key,
    required this.title,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
      decoration: BoxDecoration(
        color: const Color(0xff0029BA),
        image: const DecorationImage(
          image: AssetImage('assets/images/card-decoration.png'),
          fit: BoxFit.contain,
          alignment: Alignment(1, 0),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: title.length > 20 ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Image.asset(assets, width: 110),
        ],
      ),
    );
  }
}
