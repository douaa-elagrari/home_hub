// class Agency {
//   final String title;
//   final String description;
//   final String location;
//   final String phone;
//   final String image;
  


//   Agency({
//     required this.title,
//     required this.description,
//     required this.location,
//     required this.phone,
//     required this.image,
//   });
// }


class Agency {
  final int? id;
  final String title;
  final String description;
  final String location;
  final String phone;
  final String image; // keep your static image

  Agency({
    this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'phone': phone,
      'image': image,
    };
  }

  factory Agency.fromMap(Map<String, dynamic> map) {
    return Agency(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      phone: map['phone'],
      image: map['image'],
    );
  }
}

