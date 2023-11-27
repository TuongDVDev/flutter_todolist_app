import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({Key? key, required this.addTask}) : super(key: key);

  //Add Task Function
  final Function addTask;

  //Method 2: Get value from input
  TextEditingController controller = TextEditingController();

  //Method 1: Get value from input
  // String textValue = '';

  void _handleOnclick(BuildContext context) {
    //Method 1: Get value from input
    // print('_handleOnclick');
    //Method 2: Get value from input
    final name = controller.text;
    //Do not add new when data is empty
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    // print(controller.text);
    //Automatically return to the previous screen after adding a new one
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          TextField(
            //Method 2: Get value from input
            controller: controller,
            //Method 1: Get value from input
            // onChanged: (text) {
            //   textValue = text;
            // },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Your Task'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            //Add Task Button
            child: ElevatedButton(
              onPressed: () => _handleOnclick(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Text Color (Foreground color)
                backgroundColor: Colors.blue, // Background color
              ),
              child: const Text('Add Task'),
            ),
          ),
        ]),
      ),
    );
  }
}
