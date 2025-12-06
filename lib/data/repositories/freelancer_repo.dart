// repositories/freelancer_repo.dart
import 'package:sqflite/sqflite.dart';
import '../databases/dbhelper.dart';

class FreelancerJob {
  int? id;
  int userId;
  String title;
  String name;
  String location;
  String phone;
  String image;
  String price;
  String profession;
  double rating;

  FreelancerJob({
    this.id,
    required this.userId,
    required this.title,
    required this.name,
    required this.location,
    required this.phone,
    required this.image,
    required this.price,
    required this.profession,
    this.rating = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'name': name,
      'location': location,
      'phone': phone,
      'image': image,
      'price': price,
      'profession': profession,
      'rating': rating,
    };
  }

  factory FreelancerJob.fromMap(Map<String, dynamic> map) {
    return FreelancerJob(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      name: map['name'],
      location: map['location'],
      phone: map['phone'],
      image: map['image'],
      price: map['price'],
      profession: map['profession'],
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }
}

class FreelancerDBRepo {
  Future<Database> _db() async => await DBHelper.getDatabase();

  Future<int> insertFreelancerJob(FreelancerJob freelancerJob) async {
    try {
      final db = await _db();
      final id = await db.insert('freelancer', freelancerJob.toMap());
      return id;
    } catch (e) {
      print("❌ Insert freelancer job error: $e");
      return -1;
    }
  }

  Future<List<FreelancerJob>> getAllFreelancerJobs() async {
    try {
      final db = await _db();
      final result = await db.query('freelancer');
      return result.map((map) => FreelancerJob.fromMap(map)).toList();
    } catch (e) {
      print("❌ Get all freelancer jobs error: $e");
      return [];
    }
  }

  Future<FreelancerJob?> getFreelancerJobByUserId(int userId) async {
    try {
      final db = await _db();
      final result = await db.query(
        'freelancer',
        where: 'user_id = ?',
        whereArgs: [userId],
        limit: 1,
      );
      if (result.isNotEmpty) {
        return FreelancerJob.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print("❌ Get freelancer job by user id error: $e");
      return null;
    }
  }

  Future<bool> freelancerJobExists(int userId) async {
    try {
      final db = await _db();
      final result = await db.query(
        'freelancer',
        where: 'user_id = ?',
        whereArgs: [userId],
      );
      return result.isNotEmpty;
    } catch (e) {
      print("❌ Check freelancer job exists error: $e");
      return false;
    }
  }
}