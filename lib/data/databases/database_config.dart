import 'package:flutter/rendering.dart';

class DatabaseConfig {
  static const String databaseName = "users.db";
  static const int databaseVersion = 1;

  // Users table
  static const String users = "users";
  static const String userId = "id";
  static const String userType = "type";
  static const String userName = "name";
  static const String userEmail = "email";
  static const String userPassword = "password";
  static const String fullname = "fname";
  static const String birthdate = "bd";
  static const String address = "addr";
  static const String companyName = "cname";
  static const String phone = "phone"; // ⭐ ADDED
  static const String vatNumber = "vat"; // ⭐ ADDED

  // Products table
  static const String products = "products";
  static const String productId = "pid";
  static const String productName = "pname";
  static const String productDescription = "pdesc";
  static const String productPrice = "pprice";
  static const String productCategory = "pcat";
  static const String productImageId = "pimgid";
  static const String productRating = "prating";
  static const String productColors = "pcolors";

  // SQL CREATE TABLE statements
  static const String createUsersTable =
      '''
    CREATE TABLE IF NOT EXISTS $users (
      $userId INTEGER PRIMARY KEY AUTOINCREMENT,
      $userType TEXT,
      $userName TEXT UNIQUE,
      $userEmail TEXT NOT NULL UNIQUE,
      $userPassword TEXT NOT NULL,
      $fullname TEXT,
      $birthdate TEXT,
      $address TEXT,
      $companyName TEXT,
      $phone TEXT,
      $vatNumber TEXT
    )
  ''';

  static const String createProductsTable =
      '''
    CREATE TABLE IF NOT EXISTS $products (
      $productId INTEGER PRIMARY KEY AUTOINCREMENT,
      $productName TEXT,
      $productDescription TEXT,
      $productPrice REAL,
      $productCategory TEXT,
      $productImageId TEXT,
      $productRating REAL,
      $productColors TEXT
    )
  ''';
}
