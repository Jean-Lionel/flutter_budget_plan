import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatelessWidget {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                )),
            TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                )),
            TextButton(
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text(
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
