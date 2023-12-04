import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/modal/items.dart';
import 'package:flutter_todolist_app/widget/card_modal_bottom.dart';

import 'widget/card_body_widget.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  //Setstate of this application
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [
    // DataItems(id: '1', name: 'Tập thể dục'),
    // DataItems(id: '2', name: 'Bơi lội'),
    // DataItems(id: '3', name: 'Làm việc'),
    // DataItems(id: '4', name: 'Ăn trưa'),
  ];

  //Add Task Function
  void _handleAddTask(String name) {
    // print(name);
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    // print(items);
    ////Automatically return to the previous screen after adding a new one
    setState(() {
      items.add(newItem);
    });
  }

  //Delete function
  void _handleDeleteTask(String id) {
    // print(id);
    //Automatically return to the previous screen after clearing data
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

//This Widget is the root of my application.
  @override
  //This code creates a title for the application
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      //Header
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDoList',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      //This code creates the body for the application
      //Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          //This code creates new tabs for the application
          children: items
              .map((item) => CardBody(
                    //Change tag color in even and odd order
                    index: items.indexOf(item),
                    item: item,
                    handleDelete: _handleDeleteTask,
                  ))
              .toList(),
        ),
      ),
      //This code creates a new add button for the application
      //Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              //This code declares the input modal for the application
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return ModalBottom(addTask: _handleAddTask);
              });
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
