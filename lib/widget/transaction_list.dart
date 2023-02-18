import 'package:flutter/material.dart';
import '../models/tranaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: _userTransactions
                .map(
                  (trans) => Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2,
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Text(
                              'A : ${trans.amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trans.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(new DateFormat().format(trans.date)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
