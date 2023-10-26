import 'dart:math';

class Course {
  String name;
  String about;
  double price;
  String instructor;
  double rating;
  String image;

  Course({
    required this.name,
    required this.about,
    required this.price,
    required this.instructor,
    required this.rating,
    required this.image,
  });
}

class School {
  String name;
  String description;
  double rating;
  LatLng location; // Using LatLng for latitude and longitude
  List<Course> courses;
  String address;
  String image;
  double distance;

  School({
    required this.name,
    required this.description,
    required this.rating,
    required this.location,
    required this.courses,
    required this.address,
    required this.image,
    this.distance = 0,
  });
}

class LatLng {
  double latitude;
  double longitude;

  LatLng(this.latitude, this.longitude);
}

List<School> schoolList = [
  School(
    name: 'Nishan Learners',
    description: 'Description 1',
    rating: 4.5,
    //37.423410, -122.082659 near google
    location: LatLng(37.423410, -122.082659),
    courses: [
      Course(
        name: 'Math',
        about: 'Learn fundamental math concepts.',
        price: 99.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
      Course(
        name: 'Science',
        about: 'Explore the world of science.',
        price: 149.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
    ],
    address: '123 Main St, City, State',
    image: '',
    
  ),
  School(
    name: 'Samagi Learners',
    description: 'Description 2',
    rating: 4.2,
    location: LatLng(41.0, -81.0),
    courses: [
      Course(
        name: 'English',
        about: 'Improve your English language skills.',
        price: 79.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
      Course(
        name: 'History',
        about: 'Discover the past.',
        price: 129.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
    ],
    address: '456 Elm St, City, State',
    image: '',

  ),
  School(
    name: 'Napoli Learners',
    description: 'Description 3',
    rating: 4.8,
    location: LatLng(39.5, -79.5),
    courses: [
      Course(
        name: 'Art',
        about: 'Unleash your creativity.',
        price: 119.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
      Course(
        name: 'Music',
        about: 'Explore the world of music.',
        price: 169.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
    ],
    address: '789 Oak St, City, State',
    image: '',
 
  ),
  School(
    name: 'Ishan Learners',
    description: 'Description 4',
    rating: 4.0,
    location: LatLng(39.8, -79.2),
    courses: [
      Course(
        name: 'Physics',
        about: 'Learn the laws of the universe.',
        price: 139.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
      Course(
        name: 'Chemistry',
        about: 'Explore the world of molecules.',
        price: 159.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
    ],
    address: '101 Pine St, City, State',
    image: '',
  
  ),
  School(
    name: 'Gampaha Central Learners',
    description: 'Description 5',
    rating: 4.3,
    location: LatLng(40.2, -79.8),
    courses: [
      Course(
        name: 'Physical Education',
        about: 'Stay fit and active.',
        price: 89.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
      Course(
        name: 'Computer Science',
        about: 'Master the world of computers.',
        price: 179.99,
        instructor: 'Nishan Dissanayaka',
        rating: 4.2,
        image: '',
      ),
    ],
    address: '202 Cedar St, City, State',
    image: '',
   
  ),
];
