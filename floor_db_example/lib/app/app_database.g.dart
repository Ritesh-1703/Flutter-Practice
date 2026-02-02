// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `students` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `course` TEXT NOT NULL, `marks` REAL NOT NULL, `imageUrl` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentEntityInsertionAdapter = InsertionAdapter(
            database,
            'students',
            (StudentEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'course': item.course,
                  'marks': item.marks,
                  'imageUrl': item.imageUrl
                }),
        _studentEntityUpdateAdapter = UpdateAdapter(
            database,
            'students',
            ['id'],
            (StudentEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'course': item.course,
                  'marks': item.marks,
                  'imageUrl': item.imageUrl
                }),
        _studentEntityDeletionAdapter = DeletionAdapter(
            database,
            'students',
            ['id'],
            (StudentEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'course': item.course,
                  'marks': item.marks,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentEntity> _studentEntityInsertionAdapter;

  final UpdateAdapter<StudentEntity> _studentEntityUpdateAdapter;

  final DeletionAdapter<StudentEntity> _studentEntityDeletionAdapter;

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM students ORDER BY id ASC',
        mapper: (Map<String, Object?> row) => StudentEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            course: row['course'] as String,
            marks: row['marks'] as double,
            imageUrl: row['imageUrl'] as String));
  }

  @override
  Future<void> insertStudent(StudentEntity student) async {
    await _studentEntityInsertionAdapter.insert(
        student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(StudentEntity student) async {
    await _studentEntityUpdateAdapter.update(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteStudent(StudentEntity student) async {
    await _studentEntityDeletionAdapter.delete(student);
  }
}
