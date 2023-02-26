import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  DateTime? _selectDateTime;

  void submitVal() {
    if (amountController.text == null) {
      return;
    }
    String title = titleController.text;
    double amount = double.parse(amountController.text);
    if (title.isEmpty || amount < 0 || _selectDateTime == null) {
      return;
    }
    widget.addTx(title, amount, _selectDateTime);

    Navigator.of(context).pop();
  }

  void _presetDatePicker() {
    print('=============');
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDateTime = pickedDate;
      });
    });
  }

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
              ),
              onSubmitted: (_) => submitVal,
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitVal,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectDateTime == null
                        ? 'No Date Choosed'
                        : DateFormat.yMMMd()
                            .format(_selectDateTime as DateTime)),
                  ),
                  TextButton(
                    onPressed: _presetDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: submitVal,
                  child: const Text(
                    "Add Transaction",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
