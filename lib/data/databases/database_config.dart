class DatabaseConfig {
  static const String databaseName = "app.db";
  static const int databaseVersion = 3; // Increment to 3

  // Updated users table with freelancer columns
  static const String createUsersTable = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT UNIQUE,
      password TEXT,
      type TEXT,
      cname TEXT,
      phone TEXT,
      vat TEXT,
      location TEXT,
      description TEXT,
      fname TEXT,
      bd TEXT,
      addr TEXT,
      profession TEXT,
      city TEXT
    )
  ''';

  static const String createProductsTable = '''
    CREATE TABLE products(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      price REAL
    )
  ''';

  static const String createAgencyTable = '''
    CREATE TABLE agency(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      location TEXT,
      phone TEXT,
      image TEXT
    )
  ''';
  
  // NEW: Freelancer table for job cards
  static const String createFreelancerTable = '''
    CREATE TABLE freelancer(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER,
      title TEXT,
      name TEXT,
      location TEXT,
      phone TEXT,
      image TEXT,
      price TEXT,
      profession TEXT,
      rating REAL DEFAULT 0.0,
      FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    )
  ''';
}