class School {
  final String schoolName;
  final String address;
  final String contactNo1;
  final String contactNo2;
  final String aboutUs;
  final double latitude;
  final double longitude;
  final String imageBase64;
  final double rating;
  double distance;

  School({
    required this.schoolName,
    required this.address,
    required this.contactNo1,
    required this.contactNo2,
    required this.aboutUs,
    required this.latitude,
    required this.longitude,
    required this.imageBase64,
    this.rating = 4.5,
    this.distance = 0.0,
  });
}