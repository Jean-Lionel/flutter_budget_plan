import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatelessWidget {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                )),
            TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                )),
            TextButton(
              onPressed: () {
                print(amountController.text);
                print(titleController.text);
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
