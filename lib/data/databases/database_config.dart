class DatabaseConfig {
  static const String databaseName = "app.db";
  static const int databaseVersion = 1;

  // Users table
  static const String createUsersTable = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      password TEXT,
      type TEXT,
      cname TEXT,
      phone TEXT,
      vat TEXT,
      location TEXT,
      description TEXT,
      fname TEXT,
      bd TEXT,
      addr TEXT
    )
  ''';

  // Products table (keep yours)
  static const String createProductsTable = '''
    CREATE TABLE products(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      price REAL
    )
  ''';

  // Agencies table
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
}
