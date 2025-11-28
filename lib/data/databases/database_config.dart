import 'package:flutter/rendering.dart';

class DatabaseConfig {
  static const String databaseName = "users.db";

  static const int databaseVersion = 1;

  // ===== TABLE NAMES =====

  // ====== users table ======
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

  // ==========products table =============
  static const String products = "products";

  static const String productId = "pid";
  static const String productName = "pname";
  static const String productDescription = "pdesc";
  static const double productPrice = 0.0;
  static const String productCategory = "pcat";
  static const String productImageId = "pimgid";
  static const double productRating = 0.0;
  static const String productColors = "pcolors";

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

      CREATE TABLE $products(
      $productId INTEGER PRIMARY KEY AUTOINCREMENT,
      $productName TEXT,
      $productDescription TEXT,
      $productPrice REAL,
      $productCategory TEXT,
      $productImageId TEXT,
      $productRating REAL,
      $productColors TEXT,
      )

  ''';
}
