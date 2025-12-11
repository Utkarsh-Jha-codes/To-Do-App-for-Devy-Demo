import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController taskController = TextEditingController();

  @override
  void dispose () {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Color(0xFF008B8B),
        title: Center(
          child: Text("Add Task",
          style: TextStyle(
            fontSize: 40,
          ),),
        ),
      ),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Container(
          color: Colors.amberAccent,
          child: TextField(
            controller: taskController,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Enter the Task",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 12)
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 5, left: 5),
        child: Container(
          width: 380,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextButton(
              onPressed: () {
                if (taskController.text.trim().isNotEmpty) {
                  Navigator.pop(context, taskController.text);
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter Task to Save"),
                    ),
                  );
                }
              },
              child: Text("Save",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),)),
        ),
      )
    ],
          ),
    );
  }
}
