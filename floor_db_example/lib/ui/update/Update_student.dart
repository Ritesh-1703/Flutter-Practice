import 'package:flutter/material.dart';

import '../../data/entity/student_entity.dart';
import '../../utils/db_provider.dart';

class UpdateStudentPage extends StatefulWidget {
  final StudentEntity student;

  const UpdateStudentPage(this.student, {super.key});

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController marksController;
  late TextEditingController imageUrlController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    courseController = TextEditingController(text: widget.student.course);
    marksController = TextEditingController(
      text: widget.student.marks.toString(),
    );
    imageUrlController = TextEditingController(text: widget.student.imageUrl);
  }

  Future<void> updateStudent() async {
    final updatedStudent = StudentEntity(
      id: widget.student.id,
      name: nameController.text,
      course: courseController.text,
      marks: double.parse(marksController.text),
      imageUrl: imageUrlController.text,
    );

    final db = await DbProvider.database;
    await db.studentDao.updateStudent(updatedStudent);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Student',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController),
            TextField(controller: courseController),
            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
            ),
            TextField(controller: imageUrlController),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: updateStudent,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
