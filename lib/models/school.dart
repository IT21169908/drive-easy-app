part of 'models.dart';

@JsonSerializable(explicitToJson: true)
class School {
  final String? id;
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
    this.id,
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

  factory School.fromJson(Map<dynamic, dynamic> json) => School(
        id: json['id'] as String?,
        schoolName: json['schoolName'] as String,
        address: json['address'] as String,
        contactNo1: json['contactNo1'] as String,
        contactNo2: json['contactNo2'] as String,
        aboutUs: json['aboutUs'] as String,
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
        imageBase64: json['imageBase64'] as String,
        rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
        distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      );

  // factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
