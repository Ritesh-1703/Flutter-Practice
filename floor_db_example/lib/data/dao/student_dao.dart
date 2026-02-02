import 'package:floor/floor.dart';
import 'package:floor_db_example/data/entity/student_entity.dart';



@dao
abstract class StudentDao {
  
  @Query("SELECT * FROM students ORDER BY id ASC")
  Future<List<StudentEntity>> getAllStudents();

  @insert
  Future<void> insertStudent(StudentEntity student);

  @update
  Future<void> updateStudent(StudentEntity student);

  @delete
  Future<void> deleteStudent(StudentEntity student);

  
}