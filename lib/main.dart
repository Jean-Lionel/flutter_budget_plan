import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_budget_app/widget/chart.dart';
import './models/tranaction.dart';
import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expensive',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'Pk1', title: 'XXX 1', amount: 253.6, date: DateTime.now()),
    Transaction(
        id: 'Pk2', title: 'XXX 452', amount: 152.6, date: DateTime.now()),
  ];

  List<Transaction> get _recetTransactions {
    var items = _userTransactions.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: 7))));
    return items.toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startModalNewItem(BuildContext ctxt) {
    showModalBottomSheet(
      context: ctxt,
      builder: (_) => NewTransaction(_addNewTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expensive"),
        actions: [
          IconButton(
              onPressed: () => _startModalNewItem(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(_recetTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startModalNewItem(context),
      ),
    );
    ;
  }
}
