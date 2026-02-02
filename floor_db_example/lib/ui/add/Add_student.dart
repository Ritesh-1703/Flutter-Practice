import 'package:floor_db_example/utils/db_provider.dart';
import 'package:flutter/material.dart';

import '../../data/entity/student_entity.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final marksController = TextEditingController();
  final imageUrlController = TextEditingController();

  Future<void> saveStudent() async {
    final student = StudentEntity(
      name: nameController.text,
      course: courseController.text,
      marks: double.parse(marksController.text),
      imageUrl: imageUrlController.text,
    );

    final db = await DbProvider.database;
    await db.studentDao.insertStudent(student);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Student',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(labelText: 'Course'),
            ),
            TextField(
              controller: marksController,
              decoration: const InputDecoration(labelText: 'Marks'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saveStudent, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
