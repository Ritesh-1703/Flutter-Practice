
import 'package:floor_db_example/app/app_database.dart';

class DbProvider {
  static AppDatabase? _database;

  static Future<AppDatabase> get database async{
    if(_database != null) return _database!;

    _database =await $FloorAppDatabase
        .databaseBuilder("student_db.db")
        .build();

    return _database!;
  }
}