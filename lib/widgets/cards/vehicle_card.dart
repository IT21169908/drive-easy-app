part of '../widgets.g.dart';

class VehicleCard extends StatelessWidget {
  final String vehicleNo;
  final String vehicleCategory;
  final VoidCallback? onPressed;

  const VehicleCard({
    super.key,
    required this.vehicleNo,
    required this.vehicleCategory,
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
          usersStack(),
          Image.asset("assets/images/track-vehicles/vehicle_card.png", width: 100),
          Text(
            vehicleNo,
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            vehicleCategory,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(left: 8),
                backgroundColor: ThemeConsts.appPrimaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: onPressed,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_right_rounded, color: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget usersStack() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Tooltip(
          message: "Passengers",
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
