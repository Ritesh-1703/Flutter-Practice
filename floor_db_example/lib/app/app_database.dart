
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_db_example/data/entity/student_entity.dart';
import 'package:floor_db_example/data/dao/student_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart';

@Database(version: 1, entities: [StudentEntity])
abstract class AppDatabase extends FloorDatabase{
  StudentDao get studentDao;
}