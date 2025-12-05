import 'package:homehub/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import '../databases/dbhelper.dart';

class AgencyDBRepo {
  Future<Database> _db() async => await DBHelper.getDatabase();

  // Insert new agency
  Future<bool> insertAgency(Agency agency) async {
    try {
      final db = await _db();
      await db.insert('agency', agency.toMap());
      return true;
    } catch (e) {
      print("❌ Insert agency error: $e");
      return false;
    }
  }

  // Fetch all agencies
  Future<List<Agency>> getAllAgencies() async {
    try {
      final db = await _db();
      final result = await db.query('agency');
      return result.map((e) => Agency.fromMap(e)).toList();
    } catch (e) {
      print("❌ Get agencies error: $e");
      return [];
    }
  }
}
