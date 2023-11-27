import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {super.key,
      required this.item,
      required this.handleDelete,
      required this.index});

  var item;
  //Change tag color in even and odd order
  var index;
  //Delete function
  final Function handleDelete;

//This code creates new tabs for the application
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        //Change tag color in even and odd order
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 110, 162, 245)
            : const Color.fromARGB(255, 224, 137, 219),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  color: Color(0xff4B4B4B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            //Trash can icon
            //Delete function
            InkWell(
              //Notification confirming data deletion
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              // () {
              //   handleDelete(item.id);
              // },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
