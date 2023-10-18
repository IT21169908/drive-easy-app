import 'dart:math';

class Course {
  String name;
  String about;
  double price;

  Course({
    required this.name,
    required this.about,
    required this.price,
  });
}

class School {
  String name;
  String description;
  double rating;
  double latitude;
  double longitude;
  List<Course> courses;
  String address;  // Added address field

  School({
    required this.name,
    required this.description,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.courses,
    required this.address,  // Added address field in the constructor
  });
}

class DummyData {
  static List<School> generateSchoolData(int itemCount) {
    List<String> schoolNames = [
      'School 1',
      'School 2',
      'School 3',
      'School 4',
      'School 5',
    ];

    List<String> descriptions = [
      'Description 1',
      'Description 2',
      'Description 3',
      'Description 4',
      'Description 5',
    ];

    List<String> addresses = [
      '123 Main St, City, State',
      '456 Elm St, City, State',
      '789 Oak St, City, State',
      '101 Pine St, City, State',
      '202 Cedar St, City, State',
    ];

    List<School> schoolList = [];

    for (int i = 0; i < itemCount; i++) {
      Random random = Random();
      double lat = 40.0 + random.nextDouble() * 10.0;
      double long = -80.0 - random.nextDouble() * 10.0;

      List<Course> courses = [
        Course(
          name: 'Math',
          about: 'Learn fundamental math concepts.',
          price: 99.99,
        ),
        Course(
          name: 'Science',
          about: 'Explore the world of science.',
          price: 149.99,
        ),
      ];

      School school = School(
        name: schoolNames[random.nextInt(schoolNames.length)],
        description: descriptions[random.nextInt(descriptions.length)],
        rating: random.nextDouble() * 5,
        latitude: lat,
        longitude: long,
        courses: courses,
        address: addresses[random.nextInt(addresses.length)],  // Add address
      );

      schoolList.add(school);
    }

    return schoolList;
  }
}
