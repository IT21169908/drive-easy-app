part of 'models.dart';

@JsonSerializable(explicitToJson: true)
class Course {
  final String id;
  final School school;
  final String name;
  final double price;
  final num tax;
  final num documentFee;
  late final num totalAmount;
  final String? instructor;
  final String description;

  Course({
    required this.id,
    required this.name,
    required this.school,
    required this.price,
    this.tax = 100,
    this.documentFee = 500,
    required this.instructor,
    required this.description,
  }) {
    totalAmount = tax + documentFee + price;
  }

  factory Course.fromJson(Map<dynamic, dynamic> json) {
    return Course(
      id: json['id'].toString(),
      name: json['name'],
      price: double.parse(json['price'].toString()),
      tax: json['tax'] as num? ?? 100,
      documentFee: json['documentFee'] as num? ?? 500,
      instructor: json['instructor'] ?? '',
      description: json['description'] ?? '',
      school: School.fromJson(json['school'] as Map<dynamic, dynamic>),
    );
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
