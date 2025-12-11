import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:to_do/Pages/AddTask.dart';

class listPage extends StatefulWidget {
  const listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  List<bool> checked = [];
  // bool a = true;

  @override
  void initState() {
    super.initState();
    checked = List.generate(5, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008B8B),
        title: Center(
          child: Text("To-Do List", style: TextStyle(fontSize: 40)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.cyanAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD44A47),
                                    Colors.cyanAccent,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    "Task",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  leading: Checkbox(
                                    value: checked[index],
                                    onChanged: (val) {
                                      setState(() {
                                        checked[index] = val!;
                                      });
                                    },
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // ),
          ),

          Positioned(
            bottom: 100,
            right: 20,
            child: Container(
              // height: 80,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTask()),
                    );
                  },
                  icon: Icon(Icons.add, size: 60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
