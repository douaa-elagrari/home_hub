class Service {
  final int? id;
  final String name;
  final String description;
  final String username;

  Service({
    this.id,
    required this.name,
    required this.description,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "username": username,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      username: map["username"],
    );
  }
}