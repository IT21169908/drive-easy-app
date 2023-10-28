part of '../widgets.g.dart';

class VehicleSpaceCard extends StatelessWidget {
  final bool isAvailable;
  final VoidCallback? onPressed;

  const VehicleSpaceCard({
    super.key,
    required this.isAvailable,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPressed,
            child: isAvailable
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.white,
                        size: 85,
                      ),
                    ),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.block_rounded,
                        color: Colors.white,
                        size: 85,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
