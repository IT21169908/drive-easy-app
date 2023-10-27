part of 'models.dart';

@JsonSerializable(explicitToJson: true)
class Course {
  String id;
  School school;
  String name;
  double price;
  String? instructor;
  String description;

  Course({
    required this.id,
    required this.name,
    required this.school,
    required this.price,
    required this.instructor,
    required this.description,
  });

  factory Course.fromJson(Map<dynamic, dynamic> json) {
    return Course(
      id: json['id'].toString(),
      name: json['name'],
      price: double.parse(json['price'].toString()),
      instructor: json['instructor'] ?? '',
      description: json['description'] ?? '',
      school: School.fromJson(json['school'] as Map<dynamic, dynamic>),
    );
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
