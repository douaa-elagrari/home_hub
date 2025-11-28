class DatabaseConfig {
  static const String databaseName = "users.db";

  static const int databaseVersion = 1;

  // ===== TABLE NAMES =====
  static const String users = "users";

  static const String userId = "id";
  static const String userType = "type";
  static const String userName = "name";
  static const String userEmail = "email";
  static const String userPassword = "password";
  static const String fullname = "fname";
  static const String birthdate = "bd";
  static const String address = "add";
  static const String companyName = "cname";

  // ===== SQL CREATE TABLE STATEMENT =====
  // This is executed when database is created for first time
  static const String createTables =
      '''
    CREATE TABLE $users (
      $userId INTEGER PRIMARY KEY AUTOINCREMENT,
      $userType TEXT,
      $userName TEXT UNIQUE,
      $userEmail INTEGER NOT NULL UNIQUE,
      $userPassword TEXT NOT NULL ,
      $fullname TEXT,
      $birthdate TEXT ,
      $address TEXT
      $companyName TEXT
    )
  ''';
}
