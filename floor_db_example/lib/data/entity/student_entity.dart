import 'package:floor/floor.dart';



@Entity(tableName: 'students')
class StudentEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String course;
  final double marks;
  final String imageUrl;

  StudentEntity({this.id, required this.name, required this.course,required this.marks,required  this.imageUrl});
}

