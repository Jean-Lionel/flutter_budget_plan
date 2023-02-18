import 'package:flutter/material.dart';
import 'package:flutter_budget_app/models/tranaction.dart';
import 'package:flutter_budget_app/widget/new_transaction.dart';
import 'package:flutter_budget_app/widget/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'Pk1', title: 'XXX 1', amount: 253.6, date: DateTime.now()),
    Transaction(
        id: 'Pk2', title: 'XXX 452', amount: 152.6, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
