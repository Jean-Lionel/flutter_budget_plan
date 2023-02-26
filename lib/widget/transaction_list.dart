import 'package:flutter/material.dart';
import '../models/tranaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return this.transactions.isEmpty
          ? Column(
              children: [
                Text("No Transaction List"),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text('${transactions[index].title}'),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    onPressed: () => deleteTransaction(transactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                      size: 25,
                    ),
                  ),
                  ),
                );
              },
            itemCount: transactions.length,
    );
  }
}
