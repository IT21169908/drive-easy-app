// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String,
      name: json['name'] as String,
      school: School.fromJson(json['school'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      tax: json['tax'] as num? ?? 100,
      documentFee: json['documentFee'] as num? ?? 500,
      instructor: json['instructor'] as String?,
      description: json['description'] as String,
    )..totalAmount = json['totalAmount'] as num;

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'school': instance.school.toJson(),
      'name': instance.name,
      'price': instance.price,
      'tax': instance.tax,
      'documentFee': instance.documentFee,
      'totalAmount': instance.totalAmount,
      'instructor': instance.instructor,
      'description': instance.description,
    };

School _$SchoolFromJson(Map<String, dynamic> json) => School(
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

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'id': instance.id,
      'schoolName': instance.schoolName,
      'address': instance.address,
      'contactNo1': instance.contactNo1,
      'contactNo2': instance.contactNo2,
      'aboutUs': instance.aboutUs,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'imageBase64': instance.imageBase64,
      'rating': instance.rating,
      'distance': instance.distance,
    };
