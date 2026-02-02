import 'package:floor_db_example/utils/db_provider.dart';
import 'package:flutter/material.dart';

import '../../data/entity/student_entity.dart';
import '../add/Add_student.dart';
import '../update/Update_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StudentEntity> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final db = await DbProvider.database;
    students = await db.studentDao.getAllStudents();
    setState(() {
      students = students;
    });
  }

  Future<void> deleteStudent(StudentEntity student) async {
    final db = await DbProvider.database;
    await db.studentDao.deleteStudent(student);
    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
          loadStudents();
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Dismissible(
            direction: DismissDirection.startToEnd,
            confirmDismiss: (_) async {
              return await showDialog(
                  context: context,
                  builder: (_)=>AlertDialog(
                    title: const Text("Delete Student"),
                    content: const Text("Are you sure you want to delete this student?"),
                    actions: [
                      TextButton(onPressed: ()=>Navigator.pop(context, false), child: const Text("No")),
                      TextButton(onPressed: ()=>Navigator.pop(context, true), child: const Text("Yes")),
                    ],
                  )
              );
            },

            key: ValueKey(student.id),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (_) => deleteStudent(student),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade300,
                child: ClipOval(
                  child: Image.network(
                    student.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.person_2);
                    },
                  ),
                ),
              ),

              title: Text(student.name),
              subtitle: Text(student.course),
              trailing: Text("Marks: ${student.marks.toString()}"),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UpdateStudentPage(student)),
                );
                loadStudents();
              },
            ),
          );
        },
      ),
    );
  }
}
